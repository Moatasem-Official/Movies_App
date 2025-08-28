import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/models/result_model.dart';

abstract class MoviesWatchListFeatureDomainRepo {
  Future<void> addMovieToWatchList({required ResultModel movie});
  Future<void> removeMovieFromWatchList({required int movieId});
  Future<Either<Failure, bool>> isMovieInWatchList({required int movieId});
  Future<Either<Failure, List<ResultModel>>> getAllWatchListMovies();
  Future<void> clearWatchList();
}
