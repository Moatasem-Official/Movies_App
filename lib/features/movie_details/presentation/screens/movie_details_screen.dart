import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_credits_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_credits_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_images_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_videos_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/similar_movies_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_app_bar.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_bloc_builder_templete.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_genres.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_movie_credits.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_movie_crew.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_movie_images_gallery.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_movie_more_like_this.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_videos_slider/custom_movie_videos_slider.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_sub_title_details.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart' hide Bone;

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});

  final ResultEntity movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomMovieDetailsBlocBuilderTemplete<MovieDetailsCubit,
              MovieDetailsEntity>(
            cubit: context.read<MovieDetailsCubit>(),
            sectionIndex: 1,
            builder: (movieDetailsEntity) => CustomMovieDetailsSliverAppBar(
              baseUrl: AppConstants.imagePathUrl,
              imagePath: movieDetailsEntity.posterPath,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<MovieDetailsCubit,
              MovieDetailsEntity>(
            cubit: context.read<MovieDetailsCubit>(),
            sectionIndex: 2,
            builder: (movieDetailsEntity) => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.all(8.0),
                child: Text(
                  movieDetailsEntity.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 5)),
          CustomMovieDetailsBlocBuilderTemplete<MovieDetailsCubit,
              MovieDetailsEntity>(
            cubit: context.read<MovieDetailsCubit>(),
            sectionIndex: 3,
            builder: (movieDetailsEntity) =>
                CustomSubTitleDetails(movieDetailsEntity: movieDetailsEntity),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          CustomMovieDetailsBlocBuilderTemplete<MovieDetailsCubit,
              MovieDetailsEntity>(
            cubit: context.read<MovieDetailsCubit>(),
            sectionIndex: 4,
            builder: (movieDetailsEntity) => SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8),
                child: movieDetailsEntity.overview.isEmpty
                    ? Center(
                        child: Text(S.of(context).noOverviewAvailable,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 233, 233, 233),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    : Text(
                        movieDetailsEntity.overview,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          CustomMovieDetailsBlocBuilderTemplete<MovieDetailsCubit,
              MovieDetailsEntity>(
            cubit: context.read<MovieDetailsCubit>(),
            sectionIndex: 5,
            builder: (data) {
              return data.genres.isEmpty
                  ? SliverToBoxAdapter(
                      child: Center(
                        child: Text(S.of(context).noGenresAvailable,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 233, 233, 233),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    )
                  : CustomMovieGenresWidget(
                      genres: data.genres.map((e) => e.name).join(", "),
                    );
            },
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(
                S.of(context).cast,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<MovieCreditsCubit,
              MovieCreditsEntity>(
            cubit: context.read<MovieCreditsCubit>(),
            sectionIndex: 6,
            builder: (data) => CustomMovieCredits(
              movieCreditsEntity: data,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(
                S.of(context).keyCrew,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<MovieCreditsCubit,
              MovieCreditsEntity>(
            cubit: context.read<MovieCreditsCubit>(),
            sectionIndex: 7,
            builder: (data) => CustomMovieCrew(crew: data.crew),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(
                S.of(context).movieGallery,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<MovieImagesCubit,
              MovieImagesEntity>(
            cubit: context.read<MovieImagesCubit>(),
            sectionIndex: 8,
            builder: (data) => MovieImageGallery(
              images: data,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
              child: Row(
                children: [
                  Text(
                    S.of(context).moreLikeThis,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const Spacer(),
                  context.watch<SimilarMoviesCubit>().similarMovies.isEmpty
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AppRouter.seeAllElementsListScreen,
                                arguments: {
                                  "title": S.of(context).similarTo(movie.title),
                                  "movieId": movie.id
                                });
                          },
                          child: Row(
                            children: [
                              Text(
                                S.of(context).viewAll,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<SimilarMoviesCubit,
              List<ResultEntity>>(
            cubit: context.read<SimilarMoviesCubit>(),
            sectionIndex: 9,
            builder: (data) => CustomMovieMoreLikeThisWidget(
              baseUrl: AppConstants.imagePathUrl,
              similarMovies: data,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8),
              child: Text(
                S.of(context).videos,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          CustomMovieDetailsBlocBuilderTemplete<MovieVideosCubit,
              List<ResultVideoEntity>>(
            cubit: context.read<MovieVideosCubit>(),
            sectionIndex: 10,
            builder: (data) =>
                CustomMovieVideosSlider(videos: data, movie: movie),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
    );
  }
}
