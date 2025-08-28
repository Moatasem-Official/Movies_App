import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/models/result_model.dart';
import 'package:movies_app/features/watch_list/data/datasource/movies_watch_list_local_data_source.dart';
import 'package:movies_app/features/watch_list/domain/repository/movies_watch_list_feature_domain_repo.dart';

class MoviesWatchListFeatureDataRepo extends MoviesWatchListFeatureDomainRepo {
  final MoviesWatchListLocalDataSource moviesWatchListLocalDataSource;

  MoviesWatchListFeatureDataRepo(
      {required this.moviesWatchListLocalDataSource});
  @override
  Future<void> addMovieToWatchList({required ResultModel movie}) async {
    try {
      await moviesWatchListLocalDataSource.addMovie(movie);
    } catch (e) {
      CacheFailure(
        e.toString(),
      );
    }
  }

  @override
  Future<void> clearWatchList() async {
    try {
      await moviesWatchListLocalDataSource.clearWatchList();
    } catch (e) {
      CacheFailure(
        e.toString(),
      );
    }
  }

  @override
  Future<Either<Failure, List<ResultModel>>> getAllWatchListMovies() async {
    try {
      return Right(await moviesWatchListLocalDataSource.getWatchList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isMovieInWatchList(
      {required int movieId}) async {
    try {
      return Right(
          await moviesWatchListLocalDataSource.isMovieInWatchList(movieId));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<void> removeMovieFromWatchList({required int movieId}) async {
    try {
      await moviesWatchListLocalDataSource.removeMovie(movieId);
    } catch (e) {
      CacheFailure(
        e.toString(),
      );
    }
  }
}
