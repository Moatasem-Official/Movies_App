import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/discover_movies/presentation/controllers/cubit/discover_movies_cubit.dart';
import 'package:movies_app/features/discover_movies/presentation/screens/show_and_search_movies_of_category_screen.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_loading_widget.dart';

class DiscoverMoviesScreen extends StatelessWidget {
  const DiscoverMoviesScreen({super.key});

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
        child: BlocBuilder<DiscoverMoviesCubit, MoviesModuleStates>(
          builder: (context, state) {
            return state.when(
              idle: () => const SizedBox.shrink(),
              loading: () => const CustomLoadingStateWidget(),
              error: (failure) => Center(
                child: Text(
                  failure.message,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              loaded: (moviesCategories) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: moviesCategories.genres.length,
                  itemBuilder: (context, index) {
                    final genreFromApi = moviesCategories.genres[index];

                    final style = AppConstants.genreDetails[genreFromApi.id];

                    final color =
                        style?['color'] as Color? ?? Colors.grey.shade800;
                    final icon =
                        style?['icon'] as IconData? ?? Icons.movie_rounded;

                    return GenreCard(
                      genreName: genreFromApi.name,
                      genreColor: color,
                      genreIcon: icon,
                    );
                  },
                );
              },
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
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ShowAndSearchMoviesOfCategoryScreen(),
      )),
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
