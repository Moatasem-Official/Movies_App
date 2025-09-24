import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/discover_movies/presentation/controllers/cubit/category_movies_cubit.dart';
import 'package:movies_app/features/discover_movies/presentation/widgets/show_and_search_movies_of_category_screen/custom_category_app_bar.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_initial_search_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_no_movies_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movies_grid_result.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_loading_widget.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

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
                      Text(message,
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
                        Text(message,
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                ));
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
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
        body: BlocBuilder<CategoryMoviesCubit,
            MoviesModuleStates<List<ResultEntity>>>(
          builder: (context, state) {
            return state.when(
              idle: () => const CustomInitialSearchWidget(),
              loading: () => const CustomLoadingStateWidget(),
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
        ),
      ),
    );
  }
}
