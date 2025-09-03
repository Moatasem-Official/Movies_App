import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/custom_watch_list_grid.dart';

class MoviesWatchListScreen extends StatelessWidget {
  const MoviesWatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMovieToWatchListAsLocalDataCubit,
        AddMovieToWatchListAsLocalDataState>(
      listener: (context, state) {
        state.maybeWhen(
          clearAllWatchlist: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.teal,
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
                    Text(message, style: const TextStyle(color: Colors.white)),
                  ],
                ),
                duration: const Duration(seconds: 1),
              ),
            );
            context
                .read<AddMovieToWatchListAsLocalDataCubit>()
                .getAllWatchListMovies();
          },
          movieRemovedFromWatchlist: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.teal,
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
                    Text(message, style: const TextStyle(color: Colors.white)),
                  ],
                ),
                duration: const Duration(seconds: 1),
              ),
            );
            context
                .read<AddMovieToWatchListAsLocalDataCubit>()
                .getAllWatchListMovies();
          },
          error: (failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: Colors.red,
            ),
          ),
          orElse: () => null,
        );
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0b0213), Color(0xFF1a0933)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    pinned: true,
                    expandedHeight: 120,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BlocBuilder<AddMovieToWatchListAsLocalDataCubit,
                                  AddMovieToWatchListAsLocalDataState>(
                                builder: (context, state) {
                                  final cubit = context.watch<
                                      AddMovieToWatchListAsLocalDataCubit>();
                                  return cubit.watchlistIds.isNotEmpty
                                      ? IconButton(
                                          onPressed: () async {
                                            final shouldClear =
                                                await showDialog<bool>(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text(
                                                    'Clear Watchlist'),
                                                content: const Text(
                                                    'Are you sure you want to clear the watchlist ?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, false),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, true),
                                                    child: const Text('Clear'),
                                                  ),
                                                ],
                                              ),
                                            );

                                            if (shouldClear == true) {
                                              context
                                                  .read<
                                                      AddMovieToWatchListAsLocalDataCubit>()
                                                  .clearAllMoviesFromWatchList();
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.clear_all_rounded,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Container();
                                },
                              ),
                              Text(
                                'My Watchlist',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              BlocBuilder<AddMovieToWatchListAsLocalDataCubit,
                                  AddMovieToWatchListAsLocalDataState>(
                                builder: (context, state) {
                                  final cubit = context.watch<
                                      AddMovieToWatchListAsLocalDataCubit>();
                                  return cubit.watchlistIds.isNotEmpty
                                      ? IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.search,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        )
                                      : Container();
                                },
                              ),
                            ],
                          ),
                        )),
                  ),
                  const CustomWatchListGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
