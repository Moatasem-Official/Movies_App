import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_router.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/utils/app_constants.dart';
import 'custom_movie_image_error_widget.dart';
import '../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import '../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

class MovieCard extends StatelessWidget {
  final ResultEntity movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.movieDetailsScreen,
        arguments: {"id": movie.id, "resultEntity": movie},
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: movie.posterPath != null
                  ? '${AppConstants.imagePathUrl}${movie.posterPath}'
                  : '${AppConstants.imagePathUrl}${movie.backdropPath}',
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, child, loadingProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.progress,
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                );
              },
              errorWidget: (context, error, stackTrace) {
                return const CustomMovieImageErrorWidget();
              },
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        movie.releaseDate.split('-')[0],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        movie.voteAverage.toStringAsFixed(1).toString(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            BlocBuilder<AddMovieToWatchListAsLocalDataCubit,
                AddMovieToWatchListAsLocalDataState>(
              builder: (context, state) {
                final watchlistCubit =
                    context.watch<AddMovieToWatchListAsLocalDataCubit>();
                final isMovieInWatchList =
                    watchlistCubit.isMovieInWatchList(movie.id);
                return Positioned(
                  top: 5,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54.withAlpha(150),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        watchlistCubit.toggleMovieInWatchList(movie);
                      },
                      icon: Icon(
                        isMovieInWatchList
                            ? Icons.bookmark
                            : Icons.bookmark_border_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
