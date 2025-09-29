import 'package:flutter/material.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomMovieGenresWidget extends StatelessWidget {
  const CustomMovieGenresWidget({super.key, required this.genres});

  final String genres;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).genres,
              style: const TextStyle(color: Colors.white, fontSize: 20),
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
