import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import 'custom_empty_elements_widget.dart';
import '../../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import '../../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import '../../../../../generated/l10n.dart';

class CustomMovieMoreLikeThisWidget extends StatelessWidget {
  const CustomMovieMoreLikeThisWidget({
    super.key,
    required this.baseUrl,
    required this.similarMovies,
  });

  final String baseUrl;
  final List<ResultEntity> similarMovies;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: similarMovies.isEmpty
          ? EmptyStateWidget(
              message: S.of(context).noSimilarMoviesFound,
            )
          : CarouselSlider.builder(
              itemCount: similarMovies.length,
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    AppRouter.movieDetailsScreen,
                    arguments: {
                      "resultEntity": similarMovies[index],
                      "id": similarMovies[index].id,
                    },
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: (similarMovies[index].posterPath != null)
                                ? CachedNetworkImageProvider(
                                    '$baseUrl${similarMovies[index].posterPath}',
                                  )
                                : (similarMovies[index].backdropPath != null)
                                    ? CachedNetworkImageProvider(
                                        '$baseUrl${similarMovies[index].backdropPath}',
                                      )
                                    : const AssetImage('assets/images/1852.jpg')
                                        as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      BlocBuilder<AddMovieToWatchListAsLocalDataCubit,
                          AddMovieToWatchListAsLocalDataState>(
                        builder: (context, state) {
                          final watchlistCubit = context
                              .watch<AddMovieToWatchListAsLocalDataCubit>();
                          final isMovieInWatchList = watchlistCubit
                              .isMovieInWatchList(similarMovies[index].id);
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
                                  watchlistCubit.toggleMovieInWatchList(
                                      similarMovies[index]);
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
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                height: 350,
                enlargeCenterPage: true,
                viewportFraction: 0.6,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
    );
  }
}
