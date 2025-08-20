import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class DifferentMoviesTypesDomainRepo {
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getNowPlayingMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getPopularMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getTopRatedMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getUpcomingMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getMovieDetails({
    required int movieId,
  });
}
