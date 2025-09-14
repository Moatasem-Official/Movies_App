import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_loading_widget.dart';
import 'package:movies_app/features/movies_search/presentation/controllers/cubit/movies_search_cubit.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_initial_search_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_no_movies_widget.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_app_bar.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movies_grid_result.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

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
  bool _isSearching = false;

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
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
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
                      page: 1,
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
              ),
              orElse: () => null,
            );
          },
          child: BlocBuilder<MoviesSearchCubit,
              MoviesModuleStates<List<ResultEntity>>>(
            builder: (context, state) {
              return state.when(
                idle: () => const CustomInitialSearchWidget(),
                loading: () => const CustomLoadingStateWidget(),
                loaded: (List<ResultEntity> movies) {
                  if (movies.isEmpty) {
                    return const CustomNoMoviesWidget();
                  }
                  return _isSearching
                      ? CustomSearchMoviesGridResult(
                          movies: movies,
                          animationController: _animationController,
                        )
                      : const CustomInitialSearchWidget();
                },
                error: (failure) => Center(child: Text(failure.message)),
              );
            },
          ),
        ));
  }
}
