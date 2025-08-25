import 'package:flutter/material.dart';

class CustomMovieImageErrorWidget extends StatelessWidget {
  const CustomMovieImageErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: const Icon(Icons.error_outline, color: Colors.white54),
    );
  }
}
