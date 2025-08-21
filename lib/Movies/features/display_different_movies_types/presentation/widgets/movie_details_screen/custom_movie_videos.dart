import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomMovieVideosGridViewWidget extends StatelessWidget {
  const CustomMovieVideosGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
              image: const AssetImage('assets/images/1852.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        );
              },
        options: CarouselOptions(
                autoPlay: true,
                height: 300,
                enlargeCenterPage: true,
                viewportFraction: 0.6,
                enableInfiniteScroll: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
      ),
    );
  }
}


