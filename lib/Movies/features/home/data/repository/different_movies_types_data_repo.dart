import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/home/data/datasource/home_remote_data_source.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/entities/movie_details_entity.dart';
import 'package:movies_app/Movies/features/home/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/home/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/exceptions/failure_mapper.dart';
import 'package:movies_app/core/error/exceptions/network_exception.dart';
import 'package:movies_app/core/error/failure.dart';

class DifferentMoviesTypesDataRepo implements DifferentMoviesTypesDomainRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  DifferentMoviesTypesDataRepo(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getNowPlayingMovies() async {
    try {
      return Right(await homeRemoteDataSource.getNowPlayingMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getPopularMovies() async {
    try {
      return Right(await homeRemoteDataSource.getPopularMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getTopRatedMovies() async {
    try {
      return Right(await homeRemoteDataSource.getTopRatedMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getUpcomingMovies() async {
    try {
      return Right(await homeRemoteDataSource.getUpcomingMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      return Right(await homeRemoteDataSource.getMovieDetails(movieId));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSimilarMovies({
    required int movieId,
  }) async {
    try {
      return Right(await homeRemoteDataSource.getSimilarMovies(movieId));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  }) async {
    try {
      return Right(await homeRemoteDataSource.getMovieVideos(movieId));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
