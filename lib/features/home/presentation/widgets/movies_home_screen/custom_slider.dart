import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_home_screen/custom_slider_stack_content.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
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
                // 1. نستخدم Skeletonizer مرة واحدة فقط في الأعلى
                return Skeletonizer(
                  enabled: true,
                  child: CarouselSlider.builder(
                    itemCount: 1,
                    itemBuilder: (context, index, realIndex) {
                      // 3. الهيكل الأساسي هو Stack واحد فقط
                      return Stack(
                        children: [
                          // يمثل خلفية الصورة
                          Container(
                            width: double.infinity,
                            height: 400,
                            color: Colors.black,
                          ),

                          // يمثل محتوى النصوص (تم وضعه بشكل صحيح كابن للـ Stack)
                          const Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 24.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Bone.circle(size: 15),
                                      SizedBox(width: 7),
                                      Bone(width: 120, height: 16),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Bone(width: 250, height: 24),
                                ],
                              ),
                            ),
                          ),

                          // يمثل زر المفضلة (موجود بشكل صحيح كابن للـ Stack)
                          const Positioned(
                            top: 30,
                            left: 20,
                            child: Bone.circle(size: 40),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                      autoPlay: false,
                    ),
                  ),
                );
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
                          "title": "Now Playing Movies",
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
                                  child: Image.network(
                                    '${AppConstants.imagePathUrl}${movies[itemIndex].backdropPath}',
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

class Bone extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shape;

  const Bone({
    super.key,
    this.width,
    this.height,
  }) : shape = const StadiumBorder();

  const Bone.circle({
    super.key,
    required double size,
  })  : width = size,
        height = size,
        shape = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey.shade900,
        shape: shape,
      ),
    );
  }
}
