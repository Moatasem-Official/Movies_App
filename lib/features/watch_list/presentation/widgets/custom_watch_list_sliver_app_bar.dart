import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomWatchListSliverAppBar extends StatelessWidget {
  const CustomWatchListSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                    final cubit =
                        context.watch<AddMovieToWatchListAsLocalDataCubit>();
                    return cubit.watchlistIds.isNotEmpty
                        ? IconButton(
                            onPressed: () async {
                              final shouldClear = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  icon: const Icon(
                                    Icons.delete_sweep_outlined,
                                    color: Color.fromARGB(255, 31, 56, 106),
                                    size: 50,
                                  ),
                                  title: Text(
                                    S.of(context).clearWatchlist,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: Text(
                                    S.of(context).clearWatchlistConfirmation,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  actionsAlignment: MainAxisAlignment.center,
                                  actionsPadding: const EdgeInsets.only(
                                      bottom: 20, left: 20, right: 20),
                                  actions: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: Text(
                                          S.of(context).cancel,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 34, 51, 85),
                                          foregroundColor: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                        ),
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text(S.of(context).clear,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ],
                                ),
                              );

                              if (shouldClear == true) {
                                context
                                    .read<AddMovieToWatchListAsLocalDataCubit>()
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
                  S.of(context).watchlist,
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
    );
  }
}
