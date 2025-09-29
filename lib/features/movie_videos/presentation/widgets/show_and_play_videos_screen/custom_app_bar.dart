import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CustomVideoScreenAppBar extends StatelessWidget {
  const CustomVideoScreenAppBar({super.key, required this.controller});

  final YoutubePlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.white,
              progressColors: const ProgressBarColors(
                playedColor: Colors.white,
                handleColor: Colors.white,
              ),
              aspectRatio: 16 / 9,
            ),
          ),
        ),
        Positioned.directional(
          top: 10,
          textDirection: Directionality.of(context),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsetsDirectional.all(10),
              padding: const EdgeInsetsDirectional.only(start: 8),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(100),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsetsDirectional.all(6.0),
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
