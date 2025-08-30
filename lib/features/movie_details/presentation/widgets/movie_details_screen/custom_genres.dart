import 'package:flutter/material.dart';

class CustomMovieGenresWidget extends StatelessWidget {
  const CustomMovieGenresWidget({super.key, required this.genres});

  final String genres;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "GENRES",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 5),
            Text(
              genres,
              style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
