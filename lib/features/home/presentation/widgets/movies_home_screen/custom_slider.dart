import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../core/cubits/Movies_Module_States/movies_module_states.dart';
import '../../../../../core/utils/app_constants.dart';
import '../home_skeletonizer_loading_widgets/custom_home_slider_skeletonizer_loading_widget.dart';
import 'custom_slider_stack_content.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import '../../../../../generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSlider<C extends Cubit<MoviesModuleStates<List<ResultEntity>>>>
    extends StatelessWidget {
  const CustomSlider({super.key, required this.title, required this.cubit});

  final String title;
  final C cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, MoviesModuleStates<List<ResultEntity>>>(
      bloc: cubit,
      builder: (context, state) {
        return state.whenOrNull(
              idle: () {
                return const Center(child: CircularProgressIndicator());
              },
              loading: () {
                return const CustomHomeSliderSkeletonizerLoadingWidget();
              },
              loaded: (List<ResultEntity> movies) {
                return CarouselSlider.builder(
                  itemCount: movies.length,
                  itemBuilder: (
                    BuildContext context,
                    int itemIndex,
                    int pageViewIndex,
                  ) {
                    final isMovieInWatchList = context
                        .watch<AddMovieToWatchListAsLocalDataCubit>()
                        .isMovieInWatchList(movies[itemIndex].id);
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        AppRouter.seeAllElementsListScreen,
                        arguments: {
                          "title": S.of(context).nowPlayingMovies,
                          "movie_type": "now_playing",
                        },
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 400,
                            child: Stack(
                              children: [
                                ShaderMask(
                                  shaderCallback: (rect) {
                                    return const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.black,
                                        Colors.transparent
                                      ],
                                    ).createShader(rect);
                                  },
                                  blendMode: BlendMode.dstIn,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${AppConstants.imagePathUrl}${movies[itemIndex].backdropPath}',
                                    errorWidget: (context, url, error) =>
                                        const Icon(
                                      Icons.tv_rounded,
                                      size: 100,
                                      color: Color.fromARGB(255, 36, 43, 145),
                                    ),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 400,
                                  ),
                                ),
                                CustomSliderStackContent(
                                  title: title,
                                  subtitle: movies[itemIndex].title,
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 20,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54.withAlpha(150),
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  context
                                      .read<
                                          AddMovieToWatchListAsLocalDataCubit>()
                                      .toggleMovieInWatchList(
                                          movies[itemIndex]);
                                },
                                icon: Icon(
                                  isMovieInWatchList
                                      ? Icons.bookmark
                                      : Icons.bookmark_border_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: false,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              },
              error: (Failure failure) {
                return Center(child: Text(failure.message));
              },
            ) ??
            const SizedBox.shrink();
      },
    );
  }
}
