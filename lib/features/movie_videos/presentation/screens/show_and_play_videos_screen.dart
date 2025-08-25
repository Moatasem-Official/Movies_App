import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_loading_widget.dart';
import 'package:movies_app/features/movie_videos/presentation/controllers/cubit/all_movie_videos_cubit.dart';
import 'package:movies_app/features/movie_videos/presentation/widgets/show_and_play_videos_screen/custom_app_bar.dart';
import 'package:movies_app/features/movie_videos/presentation/widgets/show_and_play_videos_screen/custom_videos_list.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowAndPlayVideosScreen extends StatefulWidget {
  const ShowAndPlayVideosScreen({super.key, required this.videoIndex});

  final int videoIndex;

  @override
  State<ShowAndPlayVideosScreen> createState() =>
      _ShowAndPlayVideosScreenState();
}

class _ShowAndPlayVideosScreenState extends State<ShowAndPlayVideosScreen> {
  YoutubePlayerController? _controller;
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.videoIndex;
    super.initState();
  }

  void _initController(String videoId) {
    _controller?.dispose();
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false, loop: true),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final videos = context.watch<AllMovieVideosCubit>().videos;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(400),
          child:
              BlocBuilder<
                AllMovieVideosCubit,
                MoviesModuleStates<List<ResultVideoEntity>>
              >(
                builder: (context, state) {
                  return state.when(
                    idle: () => Container(),
                    loading: () => const CustomLoadingStateWidget(),
                    loaded: (videos) {
                      if (_controller == null) {
                        _initController(videos[_selectedIndex].key);
                      }
                      return CustomVideoScreenAppBar(controller: _controller!);
                    },
                    error: (Failure failure) => Center(
                      child: Text("Error occured : ${failure.message}"),
                    ),
                  );
                },
              ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: const SizedBox(height: 20)),
            SliverToBoxAdapter(
              child:
                  BlocBuilder<
                    AllMovieVideosCubit,
                    MoviesModuleStates<List<ResultVideoEntity>>
                  >(
                    builder: (context, state) {
                      return state.when(
                        idle: () => Container(),
                        loading: () => const CustomLoadingStateWidget(),
                        loaded: (videos) {
                          return Text(
                            videos[_selectedIndex].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                        error: (Failure failure) => Center(
                          child: Text("Error occured : ${failure.message}"),
                        ),
                      );
                    },
                  ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 10)),
            CustomVideosListWidget(
              videos: videos,
              selectedIndex: _selectedIndex,
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
                _controller?.load(videos[index].key);
              },
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 25)),
          ],
        ),
      ),
    );
  }
}
