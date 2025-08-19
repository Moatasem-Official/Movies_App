import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubit/movies_home_screen_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movies_home_screen/custom_slider_stack_content.dart';
import 'package:movies_app/core/error/failure.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      MoviesHomeScreenCubit,
      MoviesModuleStates<List<ResultEntity>>
    >(
      builder: (context, state) {
        return state.when(
          idle: () {
            return const Center(child: CircularProgressIndicator());
          },
          loading: () {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: const Center(child: CircularProgressIndicator()),
            );
          },
          loaded: (List<ResultEntity> movies) {
            final String baseUrl = "https://image.tmdb.org/t/p/w500";
            return CarouselSlider.builder(
              itemCount: movies.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
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
                                  colors: [Colors.black, Colors.transparent],
                                ).createShader(rect);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Image.network(
                                '$baseUrl${movies[itemIndex].backdropPath}',
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
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: false,
                scrollDirection: Axis.horizontal,
              ),
            );
          },
          error: (Failure failure) {
            return Center(child: Text(failure.message));
          },
        );
      },
    );
  }
}
