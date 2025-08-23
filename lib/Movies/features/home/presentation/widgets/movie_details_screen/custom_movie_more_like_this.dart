import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/presentation/widgets/movie_details_screen/custom_empty_elements_widget.dart';

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
          ? EmptyStateWidget()
          : CarouselSlider.builder(
              itemCount: similarMovies.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: (similarMovies[index].posterPath != null)
                          ? NetworkImage(
                              '$baseUrl${similarMovies[index].posterPath}',
                            )
                          : (similarMovies[index].backdropPath != null)
                          ? NetworkImage(
                              '$baseUrl${similarMovies[index].backdropPath}',
                            )
                          : const AssetImage('assets/images/1852.jpg')
                                as ImageProvider,
                      fit: BoxFit.cover,
                    ),
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
