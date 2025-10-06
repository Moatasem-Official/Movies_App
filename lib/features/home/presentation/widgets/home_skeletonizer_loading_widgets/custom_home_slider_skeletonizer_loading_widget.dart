import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'home_bone.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomHomeSliderSkeletonizerLoadingWidget extends StatelessWidget {
  const CustomHomeSliderSkeletonizerLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: CarouselSlider.builder(
        itemCount: 1,
        itemBuilder: (context, index, realIndex) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                color: Colors.black,
              ),
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
                          HomeBone.circle(size: 15),
                          SizedBox(width: 7),
                          HomeBone(width: 120, height: 16),
                        ],
                      ),
                      SizedBox(height: 20),
                      HomeBone(width: 250, height: 24),
                    ],
                  ),
                ),
              ),
              const Positioned(
                top: 30,
                left: 20,
                child: HomeBone.circle(size: 40),
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
  }
}
