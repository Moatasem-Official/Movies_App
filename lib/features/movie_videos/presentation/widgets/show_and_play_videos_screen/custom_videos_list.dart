import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controllers/cubit/all_movie_videos_cubit.dart';
import '../../../../../core/entities/movie_videos_entity.dart';
import '../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import 'custom_video_card.dart';
import '../../../../../core/errors/failure.dart';
import '../skeletonizer_loading_widgets/custom_movie_videos_skeletonizer_loading_widget.dart';
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
