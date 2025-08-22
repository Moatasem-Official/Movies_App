import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/show_and_play_videos_screen/custom_video_card.dart';

class CustomVideosListWidget extends StatefulWidget {
  const CustomVideosListWidget({super.key});

  @override
  State<CustomVideosListWidget> createState() => _CustomVideosListWidgetState();
}

class _CustomVideosListWidgetState extends State<CustomVideosListWidget> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return CustomVideoCardWidget(
          isSelected: index == selectedIndex,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      }, childCount: 10),
    );
  }
}
