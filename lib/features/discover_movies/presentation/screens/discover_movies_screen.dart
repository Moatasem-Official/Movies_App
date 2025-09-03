import 'package:flutter/material.dart';

class DiscoverMoviesScreen extends StatelessWidget {
  const DiscoverMoviesScreen({super.key});

  final List<Map<String, dynamic>> genres = const [
    {
      'name': 'Action',
      'color': Color(0xFF1A2A44),
      'icon': Icons.local_fire_department
    },
    {
      'name': 'Comedy',
      'color': Color(0xFF2C3E50),
      'icon': Icons.sentiment_satisfied_alt
    },
    {'name': 'Drama', 'color': Color(0xFF0F2038), 'icon': Icons.theater_comedy},
    {
      'name': 'Science Fiction',
      'color': Color(0xFF1E3A5F),
      'icon': Icons.rocket
    },
    {'name': 'Horror', 'color': Color(0xFF0C162A), 'icon': Icons.castle},
    {'name': 'Romance', 'color': Color(0xFF3D3256), 'icon': Icons.favorite},
    {'name': 'Adventure', 'color': Color(0xFF1F3047), 'icon': Icons.map},
    {
      'name': 'Animation',
      'color': Color(0xFF2A426B),
      'icon': Icons.auto_awesome
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1B2A),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Discover',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: genres.length,
          itemBuilder: (context, index) {
            final genre = genres[index];
            return GenreCard(
              genreName: genre['name'],
              genreColor: genre['color'],
              genreIcon: genre['icon'],
            );
          },
        ),
      ),
    );
  }
}

class GenreCard extends StatelessWidget {
  final String genreName;
  final Color genreColor;
  final IconData genreIcon;

  const GenreCard({
    super.key,
    required this.genreName,
    required this.genreColor,
    required this.genreIcon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {},
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
