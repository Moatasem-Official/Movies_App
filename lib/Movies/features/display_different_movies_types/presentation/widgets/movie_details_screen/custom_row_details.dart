import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/utils/app_helpers.dart';

class CustomMovieRowDetailsWidget extends StatelessWidget {
  const CustomMovieRowDetailsWidget({
    super.key,
    required this.movieDetailsEntity,
  });

  final MovieDetailsEntity movieDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const SizedBox(width: 8),
          Container(
            padding: EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              movieDetailsEntity.releaseDate.split('-')[0],
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Row(
            spacing: 5,
            children: [
              Icon(Icons.star, size: 22, color: Colors.amber),
              Text(
                movieDetailsEntity.voteAverage.toStringAsFixed(1),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(width: 30),
          Text(
            AppHelpers.formatRuntime(movieDetailsEntity.runtime),
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
