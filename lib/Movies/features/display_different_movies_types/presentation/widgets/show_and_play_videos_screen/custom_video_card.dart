import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/core/utils/app_helpers.dart';
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
      onTap: () => onTap(),
      child: Container(
        height: 160,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Colors.blueGrey.withAlpha(200)
              : Colors.blueGrey.withAlpha(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: 120,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://img.youtube.com/vi/${video.key}/0.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withAlpha(100),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      timeago.format(AppHelpers.parseDate(video.publishedAt)!),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withAlpha(100),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      video.type,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
