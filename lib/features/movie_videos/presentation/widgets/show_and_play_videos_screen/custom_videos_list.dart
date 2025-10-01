import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie_videos/presentation/controllers/cubit/all_movie_videos_cubit.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/features/movie_videos/presentation/widgets/show_and_play_videos_screen/custom_video_card.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_videos/presentation/widgets/skeletonizer_loading_widgets/custom_movie_videos_skeletonizer_loading_widget.dart';
import 'package:movies_app/features/movie_videos/presentation/widgets/skeletonizer_loading_widgets/custom_skeletonizer_videos_bon.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    return BlocBuilder<AllMovieVideosCubit,
        MoviesModuleStates<List<ResultVideoEntity>>>(
      builder: (context, state) {
        return state.whenOrNull(
              idle: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              loading: () => const SliverToBoxAdapter(
                  child: Skeletonizer(
                enabled: true,
                child: CustomMovieVideosSkeletonizerLoadingWidget(),
              )),
              loaded: (videos) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 10,
                        end: 10,
                      ),
                      child: CustomVideoCardWidget(
                        isSelected: index == selectedIndex,
                        onTap: () => onTap(index),
                        video: videos[index],
                      ),
                    );
                  }, childCount: videos.length),
                );
              },
              error: (Failure failure) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(failure.message)),
                );
              },
            ) ??
            const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
