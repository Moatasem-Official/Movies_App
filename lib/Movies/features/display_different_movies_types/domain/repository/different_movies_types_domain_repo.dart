import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_details_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class DifferentMoviesTypesDomainRepo {
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getNowPlayingMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getPopularMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getTopRatedMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getUpcomingMovies();
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSimilarMovies({
    required int movieId,
  });
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  });
}
