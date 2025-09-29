import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_home_screen/custom_slider.dart';
import 'package:movies_app/features/movies_search/presentation/controllers/cubit/movies_search_cubit.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_initial_search_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_no_movies_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_app_bar.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movies_grid_result.dart';
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
            AddMovieToWatchListAsLocalDataState>(listener: (context, state) {
          state.maybeWhen(
            movieAddedToWatchlist: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: const Color(0xFF2c5364),
                  behavior: SnackBarBehavior.floating,
                  padding: const EdgeInsets.all(10),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  dismissDirection: DismissDirection.down,
                  elevation: 2,
                  content: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(S.of(context).movieAddedToWatchlistMessage,
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            movieRemovedFromWatchlist: (message) =>
                ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFF2c5364),
                behavior: SnackBarBehavior.floating,
                padding: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                dismissDirection: DismissDirection.down,
                elevation: 2,
                content: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(S.of(context).movieRemovedFromWatchlistMessage,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                duration: const Duration(seconds: 1),
              ),
            ),
            orElse: () => null,
          );
        }, child: BlocBuilder<MoviesSearchCubit,
            MoviesModuleStates<List<ResultEntity>>>(
          builder: (context, state) {
            return state.whenOrNull(
                    idle: () => const CustomInitialSearchWidget(),
                    loading: () {
                      return Skeletonizer(
                          enabled: true,
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.65,
                            ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    // Placeholder للبوستر
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey
                                            .shade900, // لون قريب للكارد النهائي
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    // Gradient افتراضي مثل الكارد النهائي
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0.9),
                                            Colors.transparent
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.center,
                                        ),
                                      ),
                                    ),
                                    // Placeholder للنصوص (title + release + rating)
                                    const Positioned(
                                      bottom: 12,
                                      left: 12,
                                      right: 12,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // title
                                          Bone(width: 120, height: 16),
                                          SizedBox(height: 4),
                                          Row(
                                            children: [
                                              Bone(
                                                  width: 40,
                                                  height: 12), // سنة الإصدار
                                              Spacer(),
                                              Bone.circle(size: 16), // نجمة
                                              SizedBox(width: 4),
                                              Bone(
                                                  width: 24,
                                                  height: 12), // تقييم
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    // زر المفضلة placeholder (دايرة فوق)
                                    const Positioned(
                                      top: 5,
                                      left: 15,
                                      child: Bone.circle(size: 48),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ));
                    },
                    paginated: (movies) {
                      final hasMore = context.read<MoviesSearchCubit>().hasMore;
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
        )));
  }
}
