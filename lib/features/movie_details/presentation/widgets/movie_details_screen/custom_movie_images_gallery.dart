import 'package:flutter/material.dart';
import '../../../domain/entities/base_movie_images_entity.dart';
import '../../../domain/entities/movie_images_entity.dart';
import 'custom_movie_images_grid.dart';
import '../../../../../generated/l10n.dart';

class MovieImageGallery extends StatelessWidget {
  const MovieImageGallery({super.key, required this.images});

  final MovieImagesEntity images;

  @override
  Widget build(BuildContext context) {
    final tabs = <String, List<BaseImageEntity>>{};
    if (images.backdrops.isNotEmpty) {
      tabs[S.of(context).backdrops] = images.backdrops;
    }
    if (images.posters.isNotEmpty) tabs[S.of(context).posters] = images.posters;
    if (images.logos.isNotEmpty) tabs[S.of(context).logos] = images.logos;

    if (tabs.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(
            S.of(context).noMovieImagesFound,
            style: const TextStyle(
              color: Color.fromARGB(255, 233, 233, 233),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: DefaultTabController(
        length: tabs.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                tabs: tabs.keys.map((title) => Tab(text: title)).toList(),
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white54,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                indicator: const ShapeDecoration(
                  shape: StadiumBorder(),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0f2027),
                      Color(0xFF203a43),
                      Color(0xFF2c5364),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: const EdgeInsets.only(top: 40),
                dividerColor: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 250,
              child: TabBarView(
                children: tabs.entries.map((entry) {
                  final tabTitle = entry.key;
                  final imageList = entry.value;

                  if (imageList.isEmpty) {
                    return Center(
                      child: Text(
                        S.of(context).noTitledFound(tabTitle),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    );
                  }

                  return CustomMovieImagesGrid(
                    images: imageList,
                    heroTagPrefix: tabTitle.substring(0, 3),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
