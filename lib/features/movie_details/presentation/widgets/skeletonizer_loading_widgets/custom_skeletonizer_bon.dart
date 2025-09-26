import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizerBon extends StatelessWidget {
  final double width;
  final double height;
  final BoxShape shape;
  final BorderRadius borderRadius;

  const CustomSkeletonizerBon({
    super.key,
    required this.width,
    required this.height,
    this.shape = BoxShape.rectangle,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Bone(
      width: width,
      height: height,
      shape: shape,
      borderRadius: borderRadius,
    );
  }
}
