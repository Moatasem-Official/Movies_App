import 'package:flutter/material.dart';

class CustomNoMoviesWidget extends StatelessWidget {
  const CustomNoMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_filter_outlined, color: Colors.white24, size: 80),
          SizedBox(height: 10),
          Text(
            'No Movies Found',
            style: TextStyle(color: Colors.white38, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
