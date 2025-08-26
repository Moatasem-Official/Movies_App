import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_videos_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/similar_movies_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_app_bar.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_bloc_builder_templete.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_genres.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_movie_more_like_this.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_videos_slider/custom_movie_videos_slider.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_sub_title_details.dart';
import 'package:movies_app/core/utils/app_constants.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final ResultEntity movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomMovieDetailsBlocBuilderTemplete<
            MovieDetailsCubit,
            MovieDetailsEntity
          >(
            cubit: context.read<MovieDetailsCubit>(),
            builder: (movieDetailsEntity) => CustomMovieDetailsSliverAppBar(
              baseUrl: AppConstants.imagePathUrl,
              imagePath: movieDetailsEntity.posterPath,
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<
            MovieDetailsCubit,
            MovieDetailsEntity
          >(
            cubit: context.read<MovieDetailsCubit>(),
            builder: (movieDetailsEntity) => SliverToBoxAdapter(
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
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 5)),
          CustomMovieDetailsBlocBuilderTemplete<
            MovieDetailsCubit,
            MovieDetailsEntity
          >(
            cubit: context.read<MovieDetailsCubit>(),
            builder: (movieDetailsEntity) =>
                CustomSubTitleDetails(movieDetailsEntity: movieDetailsEntity),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
          CustomMovieDetailsBlocBuilderTemplete<
            MovieDetailsCubit,
            MovieDetailsEntity
          >(
            cubit: context.read<MovieDetailsCubit>(),
            builder: (movieDetailsEntity) => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  movieDetailsEntity.overview,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 30)),
          CustomMovieDetailsBlocBuilderTemplete<
            MovieDetailsCubit,
            MovieDetailsEntity
          >(
            cubit: context.read<MovieDetailsCubit>(),
            builder: (data) {
              return CustomMovieGenresWidget(
                genres: data.genres.map((e) => e.name).join(", "),
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
          CustomMovieDetailsBlocBuilderTemplete<
            SimilarMoviesCubit,
            List<ResultEntity>
          >(
            cubit: context.read<SimilarMoviesCubit>(),
            builder: (data) => CustomMovieMoreLikeThisWidget(
              baseUrl: AppConstants.imagePathUrl,
              similarMovies: data,
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: const Text(
                "Movie Videos",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<
            MovieVideosCubit,
            List<ResultVideoEntity>
          >(
            cubit: context.read<MovieVideosCubit>(),
            builder: (data) =>
                CustomMovieVideosSlider(videos: data, movie: movie),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 50)),
        ],
      ),
    );
  }
}
