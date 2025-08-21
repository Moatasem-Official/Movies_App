import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_details_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/similar_movies_cubit.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/utils/app_helpers.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String baseUrl = "https://image.tmdb.org/t/p/w500";
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BlocBuilder<
            MovieDetailsCubit,
            MoviesModuleStates<MovieDetailsEntity>
          >(
            builder: (context, state) {
              return state.when(
                idle: () {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
                loading: () {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
                loaded: (MovieDetailsEntity movieDetailsEntity) {
                  return SliverAppBar(
                    expandedHeight: 500,
                    leading: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(180),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                    ),
                    backgroundColor: Colors.black.withAlpha(180),
                    surfaceTintColor: Colors.black.withAlpha(180),
                    elevation: 0,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.network(
                        '$baseUrl${movieDetailsEntity.posterPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                error: (Failure failure) => SliverToBoxAdapter(
                  child: Center(child: Text(failure.message)),
                ),
              );
            },
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          BlocBuilder<
            MovieDetailsCubit,
            MoviesModuleStates<MovieDetailsEntity>
          >(
            builder: (context, state) {
              return state.when(
                idle: () {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
                loading: () {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
                loaded: (MovieDetailsEntity movieDetailsEntity) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        movieDetailsEntity.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
                error: (Failure failure) => SliverToBoxAdapter(
                  child: Center(child: Text(failure.message)),
                ),
              );
            },
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 5)),
          BlocBuilder<
            MovieDetailsCubit,
            MoviesModuleStates<MovieDetailsEntity>
          >(
            builder: (context, state) {
              return state.when(
                idle: () {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
                loading: () {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
                loaded: (MovieDetailsEntity movieDetailsEntity) {
                  return SliverToBoxAdapter(
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        Container(
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            movieDetailsEntity.releaseDate.split('-')[0],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.star, size: 22, color: Colors.amber),
                            Text(
                              movieDetailsEntity.voteAverage.toStringAsFixed(1),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Text(
                          AppHelpers.formatRuntime(movieDetailsEntity.runtime),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                error: (Failure failure) => SliverToBoxAdapter(
                  child: Center(child: Text(failure.message)),
                ),
              );
            },
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
          BlocBuilder<
            MovieDetailsCubit,
            MoviesModuleStates<MovieDetailsEntity>
          >(
            builder: (context, state) {
              return state.when(
                idle: () {
                  return SliverToBoxAdapter(child: const SizedBox.shrink());
                },
                loading: () {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
                loaded: (MovieDetailsEntity movieDetailsEntity) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        movieDetailsEntity.overview,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  );
                },
                error: (Failure failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message)),
                  );
                },
              );
            },
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          BlocBuilder<
            MovieDetailsCubit,
            MoviesModuleStates<MovieDetailsEntity>
          >(
            builder: (context, state) {
              return state.when(
                idle: () {
                  return SliverToBoxAdapter(child: const SizedBox.shrink());
                },
                loading: () {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
                loaded: (MovieDetailsEntity movieDetailsEntity) {
                  return SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "Genres : ${movieDetailsEntity.genres.join(", ")}",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 16),
                      ),
                    ),
                  );
                },
                error: (Failure failure) {
                  return SliverToBoxAdapter(
                    child: Center(child: Text(failure.message)),
                  );
                },
              );
            },
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: const Text(
                "MORE LIKE THIS",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          BlocBuilder<
            SimilarMoviesCubit,
            MoviesModuleStates<List<ResultEntity>>
          >(
            builder: (context, state) {
              return state.when(
                idle: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
                loading: () => SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                loaded: (List<ResultEntity> similarMovies) {
                  final baseUrl = "https://image.tmdb.org/t/p/w500";
                  return SliverToBoxAdapter(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                      itemCount: similarMovies.length,
                      itemBuilder: (context, index) => Container(
                        width: 120,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              similarMovies[index].posterPath == null
                                  ? '$baseUrl${similarMovies[index].backdropPath}'
                                  : '$baseUrl${similarMovies[index].posterPath}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                error: (Failure failure) => SliverToBoxAdapter(
                  child: Center(child: Text(failure.message)),
                ),
              );
            },
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 20)),
        ],
      ),
    );
  }
}
