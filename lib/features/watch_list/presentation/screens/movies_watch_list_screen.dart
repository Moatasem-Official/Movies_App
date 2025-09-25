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
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    pinned: true,
                    expandedHeight: 100,
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
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                icon: const Icon(
                                                  Icons.delete_sweep_outlined,
                                                  color: Color.fromARGB(
                                                      255, 31, 56, 106),
                                                  size: 50,
                                                ),
                                                title: const Text(
                                                  'Clear Watchlist ?',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                content: const Text(
                                                  'This action will permanently delete all items. Are you sure you want to proceed ?',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                actionsPadding:
                                                    const EdgeInsets.only(
                                                        bottom: 20,
                                                        left: 20,
                                                        right: 20),
                                                actions: [
                                                  Expanded(
                                                    child: OutlinedButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, false),
                                                      child:
                                                          const Text('Cancel'),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                34, 51, 85),
                                                        foregroundColor:
                                                            Theme.of(context)
                                                                .colorScheme
                                                                .onError,
                                                      ),
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context, true),
                                                      child: const Text('Clear',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .white)),
                                                    ),
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
                              Container(),
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
