import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/movies_search/presentation/widgets/custom_search_movie_card.dart';

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
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: SizedBox(
                    height: 28,
                    width: 28,
                    child: CircularProgressIndicator(
                        strokeWidth: 2, color: Colors.white),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
