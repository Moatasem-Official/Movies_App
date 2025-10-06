import 'package:flutter/material.dart';
import '../../../../generated/l10n.dart';

class CustomInitialSearchWidget extends StatelessWidget {
  const CustomInitialSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.movie_creation_outlined,
              color: Colors.white24, size: 80),
          const SizedBox(height: 10),
          Text(
            S.of(context).startTypingToSearchForAMovie,
            style: const TextStyle(color: Colors.white38, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
