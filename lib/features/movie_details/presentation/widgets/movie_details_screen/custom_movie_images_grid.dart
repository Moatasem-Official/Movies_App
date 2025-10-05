import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/base_movie_images_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_full_screen_movie_images_viewer.dart';
import 'package:shimmer/shimmer.dart';

class CustomMovieImagesGrid extends StatelessWidget {
  const CustomMovieImagesGrid(
      {super.key, required this.images, required this.heroTagPrefix});

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
                  builder: (_) => CustomFullScreenMovieImagesViewer(
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, child, loadingProgress) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade800,
                      highlightColor: Colors.grey.shade700,
                      child: Container(color: Colors.black),
                    );
                  },
                  errorWidget: (context, error, stackTrace) =>
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
