import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/home/presentation/widgets/show_and_play_videos_screen/custom_app_bar.dart';
import 'package:movies_app/Movies/features/home/presentation/widgets/show_and_play_videos_screen/custom_videos_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowAndPlayVideosScreen extends StatefulWidget {
  const ShowAndPlayVideosScreen({
    super.key,
    required this.videos,
    required this.videoIndex,
  });

  final List<ResultVideoEntity> videos;
  final int videoIndex;

  @override
  State<ShowAndPlayVideosScreen> createState() =>
      _ShowAndPlayVideosScreenState();
}

class _ShowAndPlayVideosScreenState extends State<ShowAndPlayVideosScreen> {
  late YoutubePlayerController _controller;
  late int _selectedIndex;
  @override
  void initState() {
    _selectedIndex = widget.videoIndex;
    _controller = YoutubePlayerController(
      initialVideoId: widget.videos[_selectedIndex].key,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child: CustomVideoScreenAppBar(controller: _controller),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(
              child: Text(
                widget.videos[_selectedIndex].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 10)),
            CustomVideosListWidget(
              videos: widget.videos,
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                _controller.load(widget.videos[index].key);
              },
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 25)),
          ],
        ),
      ),
    );
  }
}
