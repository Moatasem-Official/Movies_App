import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_sub_title_details.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

class CustomActionsAndStatus extends StatelessWidget {
  final MovieDetailsEntity movieDetailsEntity;
  const CustomActionsAndStatus({super.key, required this.movieDetailsEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // الحالة
        Text(
          movieDetailsEntity.status,
          style: TextStyle(
            color: Colors.greenAccent.shade400,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        // زر الإضافة للمفضلة
        BlocBuilder<AddMovieToWatchListAsLocalDataCubit,
            AddMovieToWatchListAsLocalDataState>(
          builder: (context, state) {
            final watchlistCubit =
                context.watch<AddMovieToWatchListAsLocalDataCubit>();
            final isMovieInWatchList =
                watchlistCubit.isMovieInWatchList(movieDetailsEntity.id);
            return Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  watchlistCubit.toggleMovieInWatchList(
                      movieDetailsEntity.toResultEntity());
                },
                icon: Icon(
                  isMovieInWatchList
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_border_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
