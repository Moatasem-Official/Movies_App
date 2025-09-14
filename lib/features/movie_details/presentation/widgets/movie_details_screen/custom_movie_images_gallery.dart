import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/base_movie_images_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_movie_images_grid.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:shimmer/shimmer.dart';

class MovieImageGallery extends StatelessWidget {
  const MovieImageGallery({super.key, required this.images});

  final MovieImagesEntity images;

  @override
  Widget build(BuildContext context) {
    final tabs = <String, List<BaseImageEntity>>{};
    if (images.backdrops.isNotEmpty) tabs['Backdrops'] = images.backdrops;
    if (images.posters.isNotEmpty) tabs['Posters'] = images.posters;
    if (images.logos.isNotEmpty) tabs['Logos'] = images.logos;

    if (tabs.isEmpty) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
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
                      Color(0xFF2c5364)
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
                children: tabs.values.map((imageList) {
                  return CustomMovieImagesGrid(
                    images: imageList,
                    heroTagPrefix: tabs.keys
                        .firstWhere((k) => tabs[k] == imageList)
                        .substring(0, 3),
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
