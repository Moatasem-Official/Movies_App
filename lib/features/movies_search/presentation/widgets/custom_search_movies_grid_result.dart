import 'package:flutter/material.dart';

class CustomSearchMoviesGridResult extends StatelessWidget {
  const CustomSearchMoviesGridResult({
    super.key,
    required this.animationController,
  });

  final Animation<double> animationController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return FadeTransition(
            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Interval(
                  0.3 + (index * 0.1),
                  1.0,
                  curve: Curves.easeOut,
                ),
              ),
            ),
            // child: _MovieCard(movie: movies[index]),
          );
        },
      ),
    );
  }
}
