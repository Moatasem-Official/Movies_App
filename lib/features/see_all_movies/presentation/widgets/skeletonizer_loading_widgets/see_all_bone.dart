import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SeeAllBone extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shape;
  final BorderRadius? borderRadius;

  const SeeAllBone({
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  }) : shape = const StadiumBorder();

  const SeeAllBone.circle({
    super.key,
    required double size,
    this.borderRadius = BorderRadius.zero,
  })  : width = size,
        height = size,
        shape = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Bone(
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }
}