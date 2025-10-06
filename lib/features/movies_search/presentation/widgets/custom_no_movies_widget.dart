import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class CustomNoMoviesWidget extends StatelessWidget {
  const CustomNoMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.movie_filter_outlined,
              color: Colors.white24, size: 80),
          const SizedBox(height: 10),
          Text(
            S.of(context).noMovieFound,
            style: const TextStyle(color: Colors.white38, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
