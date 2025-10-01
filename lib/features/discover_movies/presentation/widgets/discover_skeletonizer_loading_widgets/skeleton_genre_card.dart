import 'package:flutter/material.dart';
import 'package:movies_app/features/discover_movies/presentation/widgets/discover_skeletonizer_loading_widgets/discover_bone.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonGenreCard extends StatelessWidget {
  const SkeletonGenreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DiscoverBone.circle(
                size: 50,
                borderRadius:
                    BorderRadius.all(Radius.circular(10))), // هنا مش const
            SizedBox(height: 10),
            DiscoverBone(
                width: 80,
                height: 20,
                borderRadius:
                    BorderRadius.all(Radius.circular(10))), // هنا مش const
          ],
        ),
      ),
    );
  }
}
