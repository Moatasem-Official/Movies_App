import 'package:dartz/dartz.dart';
import '../entities/movie_credits_entity.dart';
import '../entities/movie_details_entity.dart';
import '../../../../core/entities/movie_videos_entity.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movie_images_entity.dart';

abstract class MovieDetailsFeatureDomainRepo {
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSimilarMovies({
    required int movieId,
    int page = 1,
  });
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  });
  Future<Either<Failure, MovieCreditsEntity>> getMovieCredits({
    required int movieId,
  });
  Future<Either<Failure, MovieImagesEntity>> getMovieImages({
    required int movieId,
  });
}
