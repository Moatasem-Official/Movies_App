import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_crew_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_crew_card.dart';

class CustomMovieCrew extends StatelessWidget {
  const CustomMovieCrew({super.key, required this.crew});

  final List<MovieCrewEntity> crew;

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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: crew.length,
              itemBuilder: (context, index) {
                final member = crew[index];
                return CustomCrewCard(member: member);
              },
            ),
          ),
        ],
      ),
    );
  }
}
