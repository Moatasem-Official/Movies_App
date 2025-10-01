import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/utils/app_helpers.dart';
import 'package:movies_app/features/movie_videos/presentation/widgets/show_and_play_videos_screen/custom_thumbnail.dart';
import 'dart:ui';

import 'package:timeago/timeago.dart' as timeago;

class CustomVideoCardWidget extends StatelessWidget {
  const CustomVideoCardWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.video,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final ResultVideoEntity video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 140,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.deepPurple.withOpacity(0.3)
                  : Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: isSelected
                    ? Colors.deepPurple.withOpacity(0.6)
                    : Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(children: [
              CustomThumbnail(
                video: video,
              ),
              buildVideoDetails()
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildVideoDetails() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              video.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 2.0, color: Colors.black54)],
              ),
            ),
            const Spacer(),
            buildInfoRow(Icons.movie_creation_outlined, video.type),
            const SizedBox(height: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildInfoRow(
                    Icons.calendar_today_outlined,
                    timeago.format(AppHelpers.parseDate(video.publishedAt)!),
                  ),
                  if (isSelected) buildPlayingIndicator(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 16),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13)),
      ],
    );
  }

  Widget buildPlayingIndicator() {
    return Image.asset(
      'assets/animations/Sound Equalizer Bars - Music.gif',
      width: 60,
      height: 60,
      fit: BoxFit.cover,
    );
  }
}
