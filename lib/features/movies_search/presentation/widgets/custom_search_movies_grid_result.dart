import 'package:flutter/material.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../home/presentation/widgets/home_skeletonizer_loading_widgets/home_bone.dart';
import 'custom_search_movie_card.dart';
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
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade900,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
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
                    )),
              ),
            )
        ],
      ),
    );
  }
}
