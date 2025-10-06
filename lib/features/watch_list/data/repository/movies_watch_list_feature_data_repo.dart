import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';
import '../datasource/movies_watch_list_local_data_source.dart';
import '../../domain/repository/movies_watch_list_feature_domain_repo.dart';

class MoviesWatchListFeatureDataRepo extends MoviesWatchListFeatureDomainRepo {
  final MoviesWatchListLocalDataSource moviesWatchListLocalDataSource;

  MoviesWatchListFeatureDataRepo(
      {required this.moviesWatchListLocalDataSource});
  @override
  Future<void> addMovieToWatchList({required ResultEntity movie}) async {
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
  Future<Either<Failure, List<ResultEntity>>> getAllWatchListMovies() async {
    try {
      return Right(await moviesWatchListLocalDataSource.getWatchList());
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
