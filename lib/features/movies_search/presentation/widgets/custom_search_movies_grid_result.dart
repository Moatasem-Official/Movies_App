import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movie_card.dart';

class CustomSearchMoviesGridResult extends StatelessWidget {
  const CustomSearchMoviesGridResult({
    super.key,
    required this.animationController,
    required this.movies,
  });

  final Animation<double> animationController;

  final List<ResultEntity> movies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Interval(
                  0.3 + (index * 0.1),
                  1.0,
                  curve: Curves.easeOut,
                ),
              ),
            ),
            child: MovieCard(movie: movies[index]),
          );
        },
      ),
    );
  }
}
