import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/movie_details/presentation/widgets/movie_videos_slider/custom_card_content.dart';
import 'package:movies_app/app/app_router.dart';
import 'dart:ui';

class CustomMovieVideosSlider extends StatelessWidget {
  const CustomMovieVideosSlider({
    super.key,
    required this.videos,
    required this.movie,
  });

  final List<ResultVideoEntity> videos;
  final ResultEntity movie;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
        itemCount: videos.length,
        itemBuilder: (context, index, realIndex) {
          final video = videos;
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRouter.showAndPlayVideosScreen,
              arguments: {
                "videos": videos,
                "id": movie.id,
                "videoIndex": index,
              },
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey.withOpacity(0.3),
                              Colors.black.withOpacity(0.5),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CustomCardContent(video: video, index: index),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 360,
          viewportFraction: 0.9,
          enlargeCenterPage: true,
          autoPlay: videos.length > 1,
          autoPlayInterval: const Duration(seconds: 5),
          enableInfiniteScroll: videos.length > 1,
          clipBehavior: Clip.none,
        ),
      ),
    );
  }
}
