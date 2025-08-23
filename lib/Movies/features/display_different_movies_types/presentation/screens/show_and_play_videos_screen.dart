import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/show_and_play_videos_screen/custom_app_bar.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/show_and_play_videos_screen/custom_videos_list.dart';

class ShowAndPlayVideosScreen extends StatelessWidget {
  const ShowAndPlayVideosScreen({super.key, required this.videos});

  final List<ResultVideoEntity> videos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(300),
        child: CustomVideoScreenAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: const Text(
              "Movie Name Here (2022) - Trailer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          CustomVideosListWidget(videos: videos),
          SliverToBoxAdapter(child: const SizedBox(height: 25)),
        ],
      ),
    );
  }
}
