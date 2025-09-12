import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_credits_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

abstract class MovieDetailsFeatureDomainRepo {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSimilarMovies({
    required int movieId,
  });
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  });
  Future<Either<Failure, MovieCreditsEntity>> getMovieCredits({
    required int movieId,
  });
}
