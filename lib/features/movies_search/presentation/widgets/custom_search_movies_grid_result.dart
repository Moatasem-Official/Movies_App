import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/home/presentation/widgets/home_skeletonizer_loading_widgets/home_bone.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_home_screen/custom_slider.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movie_card.dart';
import 'package:skeletonizer/skeletonizer.dart' hide Bone;

class CustomSearchMoviesGridResult extends StatelessWidget {
  final List<ResultEntity> movies;
  final Animation<double> fadeAnimation;
  final ScrollController scrollController;
  final bool showLoading;

  const CustomSearchMoviesGridResult({
    super.key,
    required this.movies,
    required this.fadeAnimation,
    required this.scrollController,
    this.showLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(top: 10, bottom: 8),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  // امنع start > 1.0 لأن Interval يتطلب 0..1
                  double start = 0.3 + (index * 0.1);
                  if (start > 1.0) start = 1.0;

                  return FadeTransition(
                    opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: fadeAnimation,
                        curve: Interval(start, 1.0, curve: Curves.easeOut),
                      ),
                    ),
                    child: MovieCard(movie: movies[index]),
                  );
                },
                childCount: movies.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 18,
                mainAxisSpacing: 18,
              ),
            ),
          ),

          // لو محتاج لودينج لصفحات إضافية، بنعرضه كـ SliverToBoxAdapter (footer)
          if (showLoading)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Skeletonizer(
                    enabled: true,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  color: Colors
                                      .grey.shade900, // لون قريب للكارد النهائي
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
                              // Placeholder للنصوص (title + release + rating)
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
                                        HomeBone(
                                            width: 40,
                                            height: 12), // سنة الإصدار
                                        Spacer(),
                                        HomeBone.circle(size: 16), // نجمة
                                        SizedBox(width: 4),
                                        HomeBone(
                                            width: 24, height: 12), // تقييم
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // زر المفضلة placeholder (دايرة فوق)
                              const Positioned(
                                top: 5,
                                left: 15,
                                child: HomeBone.circle(size: 48),
                              ),
                            ],
                          ),
                        );
                      },
                    )),
              ),
            )
        ],
      ),
    );
  }
}
