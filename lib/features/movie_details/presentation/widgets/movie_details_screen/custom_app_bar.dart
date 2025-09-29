import 'package:flutter/material.dart';

class CustomMovieDetailsSliverAppBar extends StatelessWidget {
  const CustomMovieDetailsSliverAppBar({
    super.key,
    required this.baseUrl,
    required this.imagePath,
  });

  final String baseUrl;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    final hasImage = imagePath != null && imagePath!.isNotEmpty;

    return SliverAppBar(
      expandedHeight: 500,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.all(10),
          padding: const EdgeInsetsDirectional.only(start: 8),
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(180),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black.withAlpha(180),
      surfaceTintColor: Colors.black.withAlpha(180),
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: hasImage
            ? Image.network(
                '$baseUrl$imagePath',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[900],
                    child: const Center(
                      child: Icon(Icons.broken_image,
                          color: Colors.white, size: 80),
                    ),
                  );
                },
              )
            : Container(
                color: Colors.grey[900],
                child: const Center(
                  child: Icon(Icons.image_not_supported,
                      color: Colors.white, size: 80),
                ),
              ),
      ),
    );
  }
}
