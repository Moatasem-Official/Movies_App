import 'package:flutter/material.dart';
import '../../../domain/entities/movie_crew_entity.dart';
import 'custom_crew_card.dart';
import '../../../../../generated/l10n.dart';

class CustomMovieCrew extends StatelessWidget {
  const CustomMovieCrew({super.key, required this.crew});

  final List<MovieCrewEntity> crew;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: crew.isEmpty
          ? Center(
              child: Text(S.of(context).noMovieCrewFound,
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
