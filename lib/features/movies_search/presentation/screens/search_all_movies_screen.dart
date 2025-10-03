import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/cubits/network/cubit/network_cubit.dart';
import 'package:movies_app/core/cubits/network/cubit/network_state.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/discover_movies/presentation/helpers/custom_snack_bar_widget.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_no_internet_widget.dart';
import 'package:movies_app/features/movies_search/presentation/controllers/cubit/movies_search_cubit.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_initial_search_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_no_movies_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_app_bar.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movies_grid_result.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/skeletonizer_loading_widgets/custom_movies_search_skeletonizer_grid_view_loading_widget.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart' hide Bone;

class SearchAllMoviesScreen extends StatefulWidget {
  const SearchAllMoviesScreen({super.key});

  @override
  State<SearchAllMoviesScreen> createState() => _SearchAllMoviesScreenState();
}

class _SearchAllMoviesScreenState extends State<SearchAllMoviesScreen>
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
      final text = _searchController.text.trim();
      if (text.isEmpty) {
        context.read<MoviesSearchCubit>().emitIdle();
      }
      setState(() {
        _isSearching = text.isNotEmpty;
      });
    });

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final cubit = context.read<MoviesSearchCubit>();
    if (!_isSearching) return;

    if (!cubit.hasMore) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!_isLoadingMore && _isSearching) {
        _isLoadingMore = true;
        cubit.searchMovies(
          query: _searchController.text,
          reset: false,
          apiKey: AppConstants.kApiKey,
        );
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: CustomSearchAppBar(
            onSearchChanged: (value) {
              if (value.isEmpty) {
                context.read<MoviesSearchCubit>().emitIdle();
              } else {
                context.read<MoviesSearchCubit>().searchMovies(
                      query: value,
                      reset: true,
                      apiKey: AppConstants.kApiKey,
                    );
              }
            },
            fadeAnimation: _fadeAnimation,
            isSearching: _isSearching,
            searchController: _searchController,
          ),
        ),
        backgroundColor: const Color(0xFF141218),
        body: BlocListener<AddMovieToWatchListAsLocalDataCubit,
            AddMovieToWatchListAsLocalDataState>(
          listener: (context, state) {
            state.maybeWhen(
              movieAddedToWatchlist: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(
                      message: S.of(context).movieAddedToWatchlistMessage),
                );
              },
              movieRemovedFromWatchlist: (message) =>
                  ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                    message: S.of(context).movieRemovedFromWatchlistMessage),
              ),
              orElse: () => null,
            );
          },
          child: BlocConsumer<NetworkCubit, NetworkState>(
            listener: (context, state) {
              state.maybeWhen(
                connected: (_) {
                  context.read<MoviesSearchCubit>().searchMovies(
                      query: _searchController.text,
                      apiKey: AppConstants.kApiKey);
                },
                orElse: () {},
              );
            },
            builder: (context, state) {
              final isDisconnected = state.maybeWhen(
                disconnected: () => true,
                orElse: () => false,
              );

              // نجيب حالة Cubit بتاع تفاصيل الفيلم
              final moviesSearchState =
                  context.watch<MoviesSearchCubit>().state;

              // لو مفيش نت && مفيش أي بيانات في الكيوبت
              if (isDisconnected && moviesSearchState is Loading) {
                return const CustomNoInternetWidget();
              }
              return BlocBuilder<MoviesSearchCubit,
                  MoviesModuleStates<List<ResultEntity>>>(
                builder: (context, state) {
                  return state.whenOrNull(
                          idle: () => const CustomInitialSearchWidget(),
                          loading: () {
                            return const CustomMoviesSearchSkeletonizerGridViewLoadingWidget();
                          },
                          paginated: (movies) {
                            final hasMore =
                                context.read<MoviesSearchCubit>().hasMore;
                            return CustomSearchMoviesGridResult(
                              movies: movies,
                              fadeAnimation: _animationController,
                              scrollController: _scrollController,
                              showLoading: hasMore,
                            );
                          },
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
                          error: (failure) {
                            _isLoadingMore = false;
                            return Center(child: Text(failure.message));
                          }) ??
                      const SizedBox.shrink();
                },
              );
            },
          ),
        ));
  }
}
