import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/entities/movie_videos_entity.dart';

class CustomThumbnail extends StatelessWidget {
  final ResultVideoEntity video;

  const CustomThumbnail({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 120,
      height: 120,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: 'https://img.youtube.com/vi/${video.key}/0.jpg',
              errorWidget: (context, url, error) => const Icon(
                Icons.video_library_outlined,
                color: Color.fromARGB(255, 55, 56, 72),
              ),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                begin: Alignment.center,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Icon(
            Icons.play_circle_fill,
            color: Colors.white.withOpacity(0.8),
            size: 40,
          ),
        ],
      ),
    );
  }
}
