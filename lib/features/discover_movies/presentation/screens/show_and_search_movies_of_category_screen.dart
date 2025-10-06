import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../core/cubits/network/cubit/network_cubit.dart';
import '../../../../core/cubits/network/cubit/network_state.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../controllers/cubit/category_movies_cubit.dart';
import '../helpers/custom_snack_bar_widget.dart';
import '../widgets/discover_skeletonizer_loading_widgets/custom_category_movies_skeletonizer_loading_widget.dart';
import '../widgets/show_and_search_movies_of_category_screen/custom_category_app_bar.dart';
import '../../../movie_details/presentation/widgets/movie_details_screen/custom_no_internet_widget.dart';
import '../../../movies_search/presentation/widgets/custom_initial_search_widget.dart';
import '../../../movies_search/presentation/widgets/custom_no_movies_widget.dart';
import '../../../movies_search/presentation/widgets/custom_search_movies_grid_result.dart';
import '../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import '../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import '../../../../generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart' hide Bone;

class ShowAndSearchMoviesOfCategoryScreen extends StatefulWidget {
  const ShowAndSearchMoviesOfCategoryScreen({
    super.key,
    required this.moviesCategoryName,
    required this.genreId,
  });

  final String moviesCategoryName;
  final int genreId;

  @override
  State<ShowAndSearchMoviesOfCategoryScreen> createState() =>
      _ShowAndSearchMoviesOfCategoryScreenState();
}

class _ShowAndSearchMoviesOfCategoryScreenState
    extends State<ShowAndSearchMoviesOfCategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final TextEditingController _searchController = TextEditingController();
  late final ScrollController _scrollController;
  bool _isSearching = false;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
      });
    });

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<CategoryMoviesCubit>();

    if (!cubit.hasMore) {
      _isLoadingMore = false;
      return;
    }

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore) {
        _isLoadingMore = true;
        if (_isSearching) {
          cubit.searchInCategory(
            genreId: widget.genreId,
            query: _searchController.text,
            reset: false,
          );
        } else {
          cubit.fetchCategoryMovies(
            genreId: widget.genreId,
            reset: false,
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMovieToWatchListAsLocalDataCubit,
        AddMovieToWatchListAsLocalDataState>(
      listener: (context, state) {
        state.whenOrNull(
            movieAddedToWatchlist: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  message: S.of(context).movieAddedToWatchlistMessage,
                ),
              );
            },
            movieRemovedFromWatchlist: (message) =>
                ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                  message: S.of(context).movieRemovedFromWatchlistMessage,
                )));
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(205),
          child: CustomCategoryAppBar(
            moviesCategoryName: widget.moviesCategoryName,
            onSearchChanged: (value) {
              if (value.isNotEmpty) {
                context.read<CategoryMoviesCubit>().searchInCategory(
                      genreId: widget.genreId,
                      query: value,
                      reset: true,
                    );
              } else {
                context.read<CategoryMoviesCubit>().fetchCategoryMovies(
                      genreId: widget.genreId,
                      reset: true,
                    );
              }
            },
            fadeAnimation: _fadeAnimation,
            isSearching: _isSearching,
            searchController: _searchController,
          ),
        ),
        backgroundColor: const Color(0xFF141218),
        body: BlocConsumer<NetworkCubit, NetworkState>(
          listener: (context, state) {
            state.maybeWhen(
              connected: (_) {
                context
                    .read<CategoryMoviesCubit>()
                    .fetchCategoryMovies(genreId: widget.genreId, reset: false);
              },
              orElse: () {},
            );
          },
          builder: (context, networkState) {
            final isDisconnected = networkState.maybeWhen(
              disconnected: () => true,
              orElse: () => false,
            );
            _checkCategoryMoviesScreenInternetConnection(
              context,
              _isSearching,
              _isLoadingMore,
              networkState,
              _animationController,
              _scrollController,
            );

            return BlocBuilder<CategoryMoviesCubit,
                MoviesModuleStates<List<ResultEntity>>>(
              builder: (context, state) {
                return state.when(
                  idle: () => const CustomInitialSearchWidget(),
                  loading: () {
                    if (isDisconnected) {
                      return FutureBuilder(
                        future: Future.delayed(const Duration(seconds: 3)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return const CustomNoInternetWidget();
                          }
                          // لحد ما يخلص الـ 3 ثواني، يفضل skeleton
                          return const CustomCategoryMoviesSkeletonizerLoadingWidget();
                        },
                      );
                    }

                    // لو في نت، رجع اللودنج العادي
                    return const CustomCategoryMoviesSkeletonizerLoadingWidget();
                  },
                  error: (failure) => Center(
                    child: Text(
                      failure.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  loaded: (movies) {
                    _isLoadingMore = false;
                    if (movies.isEmpty) {
                      return const CustomNoMoviesWidget();
                    }
                    return CustomSearchMoviesGridResult(
                      movies: movies,
                      fadeAnimation: _animationController,
                      scrollController: _scrollController,
                      showLoading: false,
                    );
                  },
                  empty: () => const CustomNoMoviesWidget(),
                  paginated: (movies) {
                    _isLoadingMore = false;
                    final cubit = context.read<CategoryMoviesCubit>();
                    return CustomSearchMoviesGridResult(
                      movies: movies,
                      fadeAnimation: _animationController,
                      scrollController: _scrollController,
                      showLoading: cubit.hasMore,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _checkCategoryMoviesScreenInternetConnection(
      BuildContext context,
      bool isSearching,
      bool isLoadingMore,
      NetworkState networkState,
      AnimationController animationController,
      ScrollController scrollController) {
    final isDisconnected = networkState.maybeWhen(
      disconnected: () => true,
      orElse: () => false,
    );

    final categoryMoviesState = context.watch<CategoryMoviesCubit>().state;

    // 🟢 1- لو النت قاطع ومافيش أي بيانات قبل كده
    if (isDisconnected && categoryMoviesState is Idle) {
      return const CustomNoInternetWidget();
    }

    // 🟢 2- لو النت قاطع واليوزر بيبحث لأول مرة
    if (isDisconnected && isSearching && categoryMoviesState is Loading) {
      return const CustomNoInternetWidget();
    }

    // 🟢 3- لو النت قاطع أثناء pagination → متعرضش NoInternet كامل، خليك على اللي موجود
    if (isDisconnected && isLoadingMore && categoryMoviesState is Paginated) {
      return CustomSearchMoviesGridResult(
        movies: (categoryMoviesState as Paginated).movies,
        fadeAnimation: animationController,
        scrollController: scrollController,
        showLoading: false, // ماتعرضش لودنج تحت
      );
    }

    return const SizedBox.shrink();
  }
}
