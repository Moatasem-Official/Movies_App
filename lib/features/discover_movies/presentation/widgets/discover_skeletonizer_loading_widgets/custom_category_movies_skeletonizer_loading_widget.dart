import 'package:flutter/material.dart';
import '../../../../home/presentation/widgets/home_skeletonizer_loading_widgets/home_bone.dart';
import 'package:skeletonizer/skeletonizer.dart' hide Bone;

class CustomCategoryMoviesSkeletonizerLoadingWidget extends StatelessWidget {
  const CustomCategoryMoviesSkeletonizerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
        enabled: true,
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.65,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Placeholder للبوستر
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900, // لون قريب للكارد النهائي
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  // Gradient افتراضي مثل الكارد النهائي
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 12,
                    left: 12,
                    right: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        HomeBone(width: 120, height: 16),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            HomeBone(width: 40, height: 12),
                            Spacer(),
                            HomeBone.circle(size: 16),
                            SizedBox(width: 4),
                            HomeBone(width: 24, height: 12),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 5,
                    left: 15,
                    child: HomeBone.circle(size: 48),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
