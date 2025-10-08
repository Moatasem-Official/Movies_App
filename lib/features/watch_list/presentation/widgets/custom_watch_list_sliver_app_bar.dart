import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import '../controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import '../../../../generated/l10n.dart';

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
                            onPressed: () {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) async {
                                final shouldClear = await showDialog<bool>(
                                  context: context,
                                  useRootNavigator: false,
                                  builder: (dialogContext) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      icon: const Icon(
                                        Icons.delete_sweep_outlined,
                                        color: Color.fromARGB(255, 31, 56, 106),
                                        size: 50,
                                      ),
                                      title: Text(
                                        S.of(dialogContext).clearWatchlist,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: Text(
                                        S
                                            .of(dialogContext)
                                            .clearWatchlistConfirmation,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      actionsPadding: const EdgeInsets.only(
                                          bottom: 20, left: 20, right: 20),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () => Navigator.pop(
                                                  dialogContext, false),
                                              child: Text(
                                                  S.of(dialogContext).cancel),
                                            ),
                                            const SizedBox(width: 12),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 34, 51, 85),
                                              ),
                                              onPressed: () => Navigator.pop(
                                                  dialogContext, true),
                                              child: Text(
                                                S.of(dialogContext).clear,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (shouldClear == true) {
                                  context
                                      .read<
                                          AddMovieToWatchListAsLocalDataCubit>()
                                      .clearAllMoviesFromWatchList();
                                }
                              });
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
