import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      SizedBox(
                        width: double.infinity,
                        height: 400,
                        child: Stack(
                          children: [
                            // الصورة الأصلية
                            Positioned.fill(
                              child: Image.asset(
                                "assets/images/1852.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),

                            // نسخة بلور من الصورة
                            Positioned.fill(
                              child: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black],
                                  ).createShader(rect);
                                },
                                blendMode: BlendMode.dstIn,
                                child: ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaX: 0,
                                    sigmaY: 10,
                                  ),
                                  child: Image.asset(
                                    "assets/images/1852.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      const SizedBox(width: 5),
                                      Text(
                                        "NOW PLAYING",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "The Dark Knight",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
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
            ),
          ),
        ],
      ),
    );
  }
}
