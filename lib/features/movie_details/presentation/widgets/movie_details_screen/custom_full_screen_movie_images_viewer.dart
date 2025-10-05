import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/base_movie_images_entity.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class CustomFullScreenMovieImagesViewer extends StatelessWidget {
  const CustomFullScreenMovieImagesViewer({
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
                imageProvider: CachedNetworkImageProvider(imageUrl),
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
