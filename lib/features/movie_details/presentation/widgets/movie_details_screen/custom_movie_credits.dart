import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_credits_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_cast_card.dart';

class CustomMovieCredits extends StatelessWidget {
  const CustomMovieCredits({super.key, required this.movieCreditsEntity});

  final MovieCreditsEntity movieCreditsEntity;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: movieCreditsEntity.cast.length,
              itemBuilder: (context, index) {
                final actor = movieCreditsEntity.cast[index];
                return CustomCastCard(actor: actor);
              },
            ),
          ),
        ],
      ),
    );
  }
}
