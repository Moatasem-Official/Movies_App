import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_videos_slider/custom_video_content.dart';

class CustomCardContent extends StatelessWidget {
  const CustomCardContent({
    super.key,
    required this.video,
    required this.index,
  });

  final List<ResultVideoEntity> video;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                'https://img.youtube.com/vi/${video[index].key}/0.jpg',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 50,
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent.withOpacity(0.6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 40,
              ),
            ),
            if (video[index].official)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Official',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        CustomVideoContent(video: video, index: index),
      ],
    );
  }
}
