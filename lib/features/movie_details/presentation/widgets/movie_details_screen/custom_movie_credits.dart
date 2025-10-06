import 'package:flutter/material.dart';
import '../../../domain/entities/movie_credits_entity.dart';
import 'custom_cast_card.dart';
import '../../../../../generated/l10n.dart';

class CustomMovieCredits extends StatelessWidget {
  const CustomMovieCredits({super.key, required this.movieCreditsEntity});

  final MovieCreditsEntity movieCreditsEntity;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: movieCreditsEntity.cast.isEmpty
          ? Center(
              child: Text(S.of(context).NoMovieCastFound,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 233, 233, 233),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
            )
          : Column(
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
