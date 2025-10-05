import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import 'package:skeletonizer/skeletonizer.dart' hide Bone;

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.resultEntity});

  final ResultEntity resultEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRouter.movieDetailsScreen,
        arguments: {"resultEntity": resultEntity, "id": resultEntity.id},
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                        '${AppConstants.imagePathUrl}${resultEntity.posterPath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                BlocBuilder<AddMovieToWatchListAsLocalDataCubit,
                    AddMovieToWatchListAsLocalDataState>(
                  builder: (context, state) {
                    final watchlistCubit =
                        context.watch<AddMovieToWatchListAsLocalDataCubit>();
                    final isMovieInWatchList =
                        watchlistCubit.isMovieInWatchList(resultEntity.id);
                    return Positioned.directional(
                      top: 5,
                      start: 5,
                      textDirection: Directionality.of(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54.withAlpha(150),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            watchlistCubit.toggleMovieInWatchList(resultEntity);
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
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16, top: 20, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resultEntity.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            resultEntity.releaseDate.split("-")[0],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Row(
                          spacing: 5,
                          children: [
                            const Icon(Icons.star,
                                size: 18, color: Colors.amber),
                            Text(
                              resultEntity.voteAverage.toStringAsFixed(1),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text(
                      resultEntity.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
