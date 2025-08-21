import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';

class CustomMovieMoreLikeThisWidget extends StatelessWidget {
  const CustomMovieMoreLikeThisWidget({
    super.key,
    required this.baseUrl,
    required this.similarMovies,
  });

  final String baseUrl;
  final List<ResultEntity> similarMovies;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: similarMovies.isEmpty
          ? _EmptyStateWidget() // 👈 هنا بنعرض الكستم ويدجت
          : GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 8, right: 8),
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: similarMovies.length,
              itemBuilder: (context, index) => Container(
                width: 120,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: (similarMovies[index].posterPath != null)
                        ? NetworkImage(
                            '$baseUrl${similarMovies[index].posterPath}',
                          )
                        : (similarMovies[index].backdropPath != null)
                        ? NetworkImage(
                            '$baseUrl${similarMovies[index].backdropPath}',
                          )
                        : const AssetImage('assets/images/1852.jpg')
                              as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
    );
  }
}

class _EmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/9693753.jpg"),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "No Similar Movies Found",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
