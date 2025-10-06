import 'package:flutter/material.dart';
import '../../../../../core/utils/app_router.dart';

class CustomDiscoverGenreCard extends StatelessWidget {
  final String genreName;
  final int genreId;
  final Color genreColor;
  final IconData genreIcon;

  const CustomDiscoverGenreCard({
    super.key,
    required this.genreName,
    required this.genreId,
    required this.genreColor,
    required this.genreIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => Navigator.of(context).pushNamed(
        AppRouter.showAndSearchMoviesOfCategoryScreen,
        arguments: {
          'moviesCategoryName': genreName,
          'genreId': genreId,
        },
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              genreColor.withOpacity(0.8),
              genreColor.withOpacity(0.5),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: genreColor.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              genreIcon,
              color: Colors.white.withOpacity(0.7),
              size: 50,
            ),
            const SizedBox(height: 10),
            Text(
              genreName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
