import 'package:flutter/material.dart';

class CustomMovieDetailsSliverAppBar extends StatelessWidget {
  const CustomMovieDetailsSliverAppBar({
    super.key,
    required this.baseUrl,
    required this.imagePath,
  });

  final String baseUrl;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left: 8),
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
        background: Image.network('$baseUrl$imagePath', fit: BoxFit.cover),
      ),
    );
  }
}
