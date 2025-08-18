import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/widgets/movies_home_screen/custom_slider_stack_content.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
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
                  child: Image.asset(imageUrl, fit: BoxFit.cover),
                ),
                CustomSliderStackContent(title: title, subtitle: subtitle),
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
  }
}
