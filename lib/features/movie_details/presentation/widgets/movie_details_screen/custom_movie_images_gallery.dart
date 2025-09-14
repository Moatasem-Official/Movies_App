import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/base_movie_images_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity.dart';
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
                  return _ImageGrid(
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

class _ImageGrid extends StatelessWidget {
  const _ImageGrid({required this.images, required this.heroTagPrefix});

  final List<BaseImageEntity> images;
  final String heroTagPrefix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 8,
          childAspectRatio: 9 / 16,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          final imageUrl = '${AppConstants.imagePathUrl}${image.filePath}';
          final heroTag = '$heroTagPrefix-$index';

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImageViewer(
                    images: images,
                    initialIndex: index,
                    heroTagPrefix: heroTagPrefix,
                  ),
                ),
              );
            },
            child: Hero(
              tag: heroTag,
              child: Card(
                elevation: 5,
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade800,
                      highlightColor: Colors.grey.shade700,
                      child: Container(color: Colors.black),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.error, color: Colors.red)),
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 500.ms, delay: (100 * index).ms)
              .slideX(begin: 0.2);
        },
      ),
    );
  }
}

class FullScreenImageViewer extends StatelessWidget {
  const FullScreenImageViewer({
    super.key,
    required this.images,
    required this.initialIndex,
    required this.heroTagPrefix,
  });

  final List<BaseImageEntity> images;
  final int initialIndex;
  final String heroTagPrefix;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: images.length,
            pageController: PageController(initialPage: initialIndex),
            builder: (context, index) {
              final image = images[index];
              final imageUrl = '${AppConstants.imagePathUrl}${image.filePath}';
              final heroTag = '$heroTagPrefix-$index';
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imageUrl),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
                heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
              );
            },
            loadingBuilder: (context, event) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
