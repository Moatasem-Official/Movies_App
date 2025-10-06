import 'package:flutter/material.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../domain/entities/movie_details_entity.dart';
import 'custom_icon_text.dart';

class CustomPrimaryInfo extends StatelessWidget {
  const CustomPrimaryInfo({super.key, required this.movieDetailsEntity});

  final MovieDetailsEntity movieDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16.0, // المسافة الأفقية بين العناصر
      runSpacing: 8.0, // المسافة الرأسية في حالة النزول لسطر جديد
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // السنة
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            movieDetailsEntity.releaseDate.split('-')[0],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // التقييم
        CustomIconText(
          icon: Icons.star_rounded,
          text: '${movieDetailsEntity.voteAverage.toStringAsFixed(1)}/10',
          iconColor: Colors.amber,
        ),
        // المدة
        CustomIconText(
          icon: Icons.timer_outlined,
          text: AppHelpers.formatRuntime(movieDetailsEntity.runtime),
        ),
      ],
    );
  }
}
