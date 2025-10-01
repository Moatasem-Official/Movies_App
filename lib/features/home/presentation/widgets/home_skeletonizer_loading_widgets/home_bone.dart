import 'package:flutter/material.dart';

class HomeBone extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shape;

  const HomeBone({
    super.key,
    this.width,
    this.height,
  }) : shape = const StadiumBorder();

  const HomeBone.circle({
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
