import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

abstract class MoviesWatchListFeatureDomainRepo {
  Future<void> addMovieToWatchList({required ResultEntity movie});
  Future<void> removeMovieFromWatchList({required int movieId});
  Future<Either<Failure, List<ResultEntity>>> getAllWatchListMovies();
  Future<void> clearWatchList();
}
