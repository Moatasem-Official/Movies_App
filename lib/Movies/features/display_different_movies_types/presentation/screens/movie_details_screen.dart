import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/utils/app_helpers.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.resultEntity});

  final ResultEntity resultEntity;

  @override
  Widget build(BuildContext context) {
    final String baseUrl = "https://image.tmdb.org/t/p/w500";
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
            backgroundColor: Colors.black.withAlpha(180),
            surfaceTintColor: Colors.black.withAlpha(180),
            elevation: 0,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                '$baseUrl${resultEntity.backdropPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                resultEntity.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 5)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                const SizedBox(width: 8),
                Container(
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    resultEntity.releaseDate.split('-')[0],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.star, size: 22, color: Colors.amber),
                    Text(
                      resultEntity.voteAverage.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 30),
                Text(
                  AppHelpers.formatDuration(
                    DateTime.parse(resultEntity.releaseDate),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                resultEntity.overview,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                "Genres : ${resultEntity.genreIds.join(", ")}",
                style: TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: const Text(
                "MORE LIKE THIS",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: GridView.builder(
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
              itemCount: 12,
              itemBuilder: (context, index) => Container(
                width: 120,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/1852.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 20)),
        ],
      ),
    );
  }
}
