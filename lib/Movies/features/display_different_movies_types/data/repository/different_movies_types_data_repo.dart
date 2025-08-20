import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/datasource/remote_data_source.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/exceptions/failure_mapper.dart';
import 'package:movies_app/core/error/exceptions/network_exception.dart';
import 'package:movies_app/core/error/failure.dart';

class DifferentMoviesTypesDataRepo implements DifferentMoviesTypesDomainRepo {
  final RemoteDataSource remoteDataSource;
  DifferentMoviesTypesDataRepo(this.remoteDataSource);

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getNowPlayingMovies() async {
    try {
      return Right(await remoteDataSource.getNowPlayingMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getPopularMovies() async {
    try {
      return Right(await remoteDataSource.getPopularMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getTopRatedMovies() async {
    try {
      return Right(await remoteDataSource.getTopRatedMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getUpcomingMovies() async {
    try {
      return Right(await remoteDataSource.getUpcomingMovies());
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      return Right(await remoteDataSource.getMovieDetails(movieId));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
