import 'package:dartz/dartz.dart';
import 'package:movies_app/features/home/data/datasource/home_remote_data_source.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/home/domain/repository/home_feature_domain_repo.dart';
import 'package:movies_app/core/errors/exceptions/failure_mapper.dart';
import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';

class HomeFeatureDataRepo implements HomeFeatureDomainRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeFeatureDataRepo(this.homeRemoteDataSource);

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getNowPlayingMovies({
    int page = 1,
  }) async {
    try {
      return Right(await homeRemoteDataSource.getNowPlayingMovies(page: page));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getPopularMovies({
    int page = 1,
  }) async {
    try {
      return Right(await homeRemoteDataSource.getPopularMovies(page: page));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getTopRatedMovies({
    int page = 1,
  }) async {
    try {
      return Right(await homeRemoteDataSource.getTopRatedMovies(page: page));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getUpcomingMovies({
    int page = 1,
  }) async {
    try {
      return Right(await homeRemoteDataSource.getUpcomingMovies(page: page));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
