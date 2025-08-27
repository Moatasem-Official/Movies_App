import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/custom_watch_list_card.dart';

class CustomWatchListGrid extends StatelessWidget {
  const CustomWatchListGrid({super.key, required this.movie});

  final List<MovieDetailsEntity> movie;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          return Dismissible(
            key: Key(movie[index].id.toString()),
            direction: DismissDirection.endToStart,
            // onDismissed: (direction) => onDismissed(index),
            background: Container(
              decoration: BoxDecoration(
                color: Colors.redAccent.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.delete_sweep_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
            child: CustomWatchListCard(movie: movie[index]),
          );
        }, childCount: movie.length),
      ),
    );
  }
}
