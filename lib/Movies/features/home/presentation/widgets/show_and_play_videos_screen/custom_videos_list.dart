import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_videos_cubit.dart';
import 'package:movies_app/Movies/features/movie_details/presentation/widgets/movie_details_screen/custom_loading_widget.dart';
import 'package:movies_app/Movies/features/home/presentation/widgets/show_and_play_videos_screen/custom_video_card.dart';
import 'package:movies_app/core/errors/failure.dart';

class CustomVideosListWidget extends StatelessWidget {
  const CustomVideosListWidget({
    super.key,
    required this.videos,
    required this.selectedIndex,
    required this.onTap,
  });

  final List<ResultVideoEntity> videos;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      MovieVideosCubit,
      MoviesModuleStates<List<ResultVideoEntity>>
    >(
      builder: (context, state) {
        return state.when(
          idle: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
          loading: () => const CustomLoadingStateWidget(),
          loaded: (videos) {
            return SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return CustomVideoCardWidget(
                  isSelected: index == selectedIndex,
                  onTap: () => onTap(index),
                  video: videos[index],
                );
              }, childCount: videos.length),
            );
          },
          error: (Failure failure) {
            return SliverToBoxAdapter(
              child: Center(child: Text(failure.message)),
            );
          },
        );
      },
    );
  }
}
