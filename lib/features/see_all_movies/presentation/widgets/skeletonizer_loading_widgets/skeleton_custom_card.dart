import 'package:flutter/material.dart';
import 'package:movies_app/features/see_all_movies/presentation/widgets/skeletonizer_loading_widgets/see_all_bone.dart';

class SkeletonCustomCard extends StatelessWidget {
  const SkeletonCustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 10),
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
      width: double.infinity,
      height: 220,
      child: Row(
        children: [
          Stack(children: [
            const SeeAllBone(
              width: 150,
              height: 200,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            Positioned.directional(
              top: 5,
              start: 5,
              textDirection: Directionality.of(context),
              child: const Padding(
                padding: EdgeInsetsDirectional.all(8.0),
                child: SeeAllBone.circle(size: 24),
              ),
            ),
          ]),
          // ignore: prefer_const_constructors
          Expanded(
            child: const Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 16, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SeeAllBone(
                      width: 100,
                      height: 16,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      SeeAllBone(
                          width: 40,
                          height: 16,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      SizedBox(width: 30),
                      Row(
                        children: [
                          SeeAllBone.circle(
                              size: 16,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          SizedBox(width: 4),
                          SeeAllBone(
                              width: 24,
                              height: 16,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SeeAllBone(
                      width: double.infinity,
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  SizedBox(height: 4),
                  SeeAllBone(
                      width: double.infinity,
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  SizedBox(height: 4),
                  SeeAllBone(
                      width: 200,
                      height: 12,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
