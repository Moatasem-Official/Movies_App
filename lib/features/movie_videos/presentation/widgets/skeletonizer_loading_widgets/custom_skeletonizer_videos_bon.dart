import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizerVideosBon extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final BoxShape shape;

  const CustomSkeletonizerVideosBon({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.shape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Bone(
      width: width,
      height: height,
      shape: shape,
      borderRadius: shape == BoxShape.circle ? null : borderRadius,
    );
  }
}
