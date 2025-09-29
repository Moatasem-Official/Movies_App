import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/discover_movies/presentation/controllers/cubit/discover_movies_cubit.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiscoverMoviesScreen extends StatelessWidget {
  const DiscoverMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).discover,
          style: const TextStyle(
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
            return state.whenOrNull(
                  idle: () => const SizedBox.shrink(),
                  loading: () {
                    // هنا نعرض Skeletonizer placeholders بدل الكارد الحقيقي
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: 8, // عدد placeholders
                      itemBuilder: (context, index) {
                        return SkeletonGenreCard(
                          genreColor: Colors.grey.shade800,
                        );
                      },
                    );
                  },
                  error: (failure) => Center(
                    child: Text(
                      failure.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  loaded: (moviesCategories) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: moviesCategories.genres.length,
                      itemBuilder: (context, index) {
                        final genreFromApi = moviesCategories.genres[index];

                        final style =
                            AppConstants.genreDetails[genreFromApi.id];

                        final color =
                            style?['color'] as Color? ?? Colors.grey.shade800;
                        final icon =
                            style?['icon'] as IconData? ?? Icons.movie_rounded;

                        return GenreCard(
                          genreName: getGenreName(context, genreFromApi.name),
                          genreId: genreFromApi.id,
                          genreColor: color,
                          genreIcon: icon,
                        );
                      },
                    );
                  },
                ) ??
                const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  String getGenreName(BuildContext context, String genre) {
    switch (genre) {
      case 'Adventure':
        return S.of(context).adventure;
      case 'Action':
        return S.of(context).action;
      case 'Animation':
        return S.of(context).animation;
      case 'Comedy':
        return S.of(context).comedy;
      case 'Crime':
        return S.of(context).crime;
      case 'Documentary':
        return S.of(context).documentary;
      case 'Drama':
        return S.of(context).drama;
      case 'Family':
        return S.of(context).family;
      case 'Fantasy':
        return S.of(context).fantasy;
      case 'History':
        return S.of(context).history;
      case 'Horror':
        return S.of(context).horror;
      case 'Music':
        return S.of(context).music;
      case 'Mystery':
        return S.of(context).mystery;
      case 'Romance':
        return S.of(context).romance;
      case 'Science Fiction':
        return S.of(context).scienceFiction;
      case 'TV Movie':
        return S.of(context).tvMovie;
      case 'Thriller':
        return S.of(context).thriller;
      case 'War':
        return S.of(context).war;
      case 'Western':
        return S.of(context).western;
      default:
        return genre; // fallback لو مش لاقي
    }
  }
}

// الكارد الحقيقي
class GenreCard extends StatelessWidget {
  final String genreName;
  final int genreId;
  final Color genreColor;
  final IconData genreIcon;

  const GenreCard({
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

// Skeletonizer placeholder للكارد
class SkeletonGenreCard extends StatelessWidget {
  final Color genreColor;

  const SkeletonGenreCard({super.key, required this.genreColor});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade700,
        highlightColor: Colors.grey.shade400,
        duration: const Duration(milliseconds: 1200),
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
        // ignore: prefer_const_constructors
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DiscoverBone.circle(
                size: 50,
                borderRadius:
                    BorderRadius.all(Radius.circular(10))), // هنا مش const
            SizedBox(height: 10),
            DiscoverBone(
                width: 80,
                height: 20,
                borderRadius:
                    BorderRadius.all(Radius.circular(10))), // هنا مش const
          ],
        ),
      ),
    );
  }
}

class DiscoverBone extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder shape;
  final BorderRadius? borderRadius;

  const DiscoverBone({
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadius.zero,
  }) : shape = const StadiumBorder();

  const DiscoverBone.circle({
    super.key,
    required double size,
    this.borderRadius,
  })  : width = size,
        height = size,
        shape = const CircleBorder();

  @override
  Widget build(BuildContext context) {
    return Bone(
      width: width,
      height: height,
      borderRadius: borderRadius,
    );
  }
}
