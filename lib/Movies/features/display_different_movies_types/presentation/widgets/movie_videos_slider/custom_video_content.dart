import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movie_videos_slider/custom_video_info.dart';
import 'package:movies_app/core/utils/app_helpers.dart';
import 'package:timeago/timeago.dart' as timeago;

class CustomVideoContent extends StatelessWidget {
  const CustomVideoContent({
    super.key,
    required this.video,
    required this.index,
  });

  final List<ResultVideoEntity> video;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video[index].name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 3,
                  color: Colors.black,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomVideoInfo(
                icon: MdiIcons.tagOutline,
                text: video[index].type,
              ),
              CustomVideoInfo(
                icon: Icons.access_time_outlined,
                text: timeago.format(
                  AppHelpers.parseDate(video[index].publishedAt)!,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
