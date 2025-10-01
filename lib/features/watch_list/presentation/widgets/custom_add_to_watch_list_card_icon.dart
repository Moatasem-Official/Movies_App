import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomAddToWatchListCardIcon extends StatelessWidget {
  const CustomAddToWatchListCardIcon({
    super.key,
    required this.movie,
  });

  final ResultEntity movie;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 15,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54.withAlpha(150),
          shape: BoxShape.circle,
        ),
        child: IconButton(
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
                  S.of(context).removeMovie,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                content: Text(
                  S.of(context).removeMovieFromWatchlist,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actionsPadding:
                    const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                actions: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: Text(
                        S.of(context).cancel,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 34, 51, 85),
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(S.of(context).remove,
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
                  .removeMovieFromWatchList(movieId: movie.id);
            }
          },
          icon: const Icon(
            Icons.bookmark,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
