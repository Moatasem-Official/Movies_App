import 'package:flutter/material.dart';

class CustomInitialSearchWidget extends StatelessWidget {
  const CustomInitialSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.movie_creation_outlined, color: Colors.white24, size: 80),
          SizedBox(height: 10),
          Text(
            'Start Typing To Search For A Movie',
            style: TextStyle(color: Colors.white38, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
