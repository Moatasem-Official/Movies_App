import 'package:dartz/dartz.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/home/data/datasource/home_local_data_source.dart';
import 'package:movies_app/features/home/data/datasource/home_remote_data_source.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/home/domain/repository/home_feature_domain_repo.dart';
import 'package:movies_app/core/errors/exceptions/failure_mapper.dart';
import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';

class HomeFeatureDataRepo implements HomeFeatureDomainRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeFeatureDataRepo(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getNowPlayingMovies({
    int page = 1,
  }) async {
    try {
      final model = await homeRemoteDataSource.getNowPlayingMovies(page: page);

      await homeLocalDataSource.cacheMovies(
          model.results, AppConstants.kNowPlayingMoviesBoxName);

      return Right(model);
    } on NetworkException catch (e) {
      final cached = await homeLocalDataSource
          .getNowPlayingMovies(AppConstants.kNowPlayingMoviesBoxName);
      if (cached.isNotEmpty) {
        return Right(
          DisplayDifferentMoviesTypesEntity(
            page: 1,
            dates: null,
            results: cached,
          ),
        );
      }
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getPopularMovies({
    int page = 1,
  }) async {
    try {
      final model = await homeRemoteDataSource.getPopularMovies(page: page);
      await homeLocalDataSource.cacheMovies(
          model.results, AppConstants.kPopularMoviesBoxName);
      return Right(model);
    } on NetworkException catch (e) {
      final cached = await homeLocalDataSource
          .getPopularMovies(AppConstants.kPopularMoviesBoxName);
      if (cached.isNotEmpty) {
        return Right(
          DisplayDifferentMoviesTypesEntity(
            page: 1,
            dates: null,
            results: cached,
          ),
        );
      }
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getTopRatedMovies({
    int page = 1,
  }) async {
    try {
      final model = await homeRemoteDataSource.getTopRatedMovies(page: page);
      await homeLocalDataSource.cacheMovies(
          model.results, AppConstants.kTopRatedMoviesBoxName);
      return Right(model);
    } on NetworkException catch (e) {
      final cached = await homeLocalDataSource
          .getTopRatedMovies(AppConstants.kTopRatedMoviesBoxName);
      if (cached.isNotEmpty) {
        return Right(
          DisplayDifferentMoviesTypesEntity(
            page: 1,
            dates: null,
            results: cached,
          ),
        );
      }
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getUpcomingMovies({
    int page = 1,
  }) async {
    try {
      final model = await homeRemoteDataSource.getUpcomingMovies(page: page);
      await homeLocalDataSource.cacheMovies(
          model.results, AppConstants.kUpcomingMoviesBoxName);
      return Right(model);
    } on NetworkException catch (e) {
      final cached = await homeLocalDataSource
          .getUpcomingMovies(AppConstants.kUpcomingMoviesBoxName);
      if (cached.isNotEmpty) {
        return Right(
          DisplayDifferentMoviesTypesEntity(
            page: 1,
            dates: null,
            results: cached,
          ),
        );
      }
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedNowPlayingMovies() async {
    final cached = await homeLocalDataSource
        .getNowPlayingMovies(AppConstants.kNowPlayingMoviesBoxName);

    if (cached.isNotEmpty) {
      return Right(
        DisplayDifferentMoviesTypesEntity(
          page: 1,
          dates: null,
          results: cached,
        ),
      );
    } else {
      return const Left(CacheFailure('No cached Now Playing movies found.'));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedPopularMovies() async {
    final cached = await homeLocalDataSource
        .getPopularMovies(AppConstants.kPopularMoviesBoxName);

    if (cached.isNotEmpty) {
      return Right(
        DisplayDifferentMoviesTypesEntity(
          page: 1,
          dates: null,
          results: cached,
        ),
      );
    } else {
      return const Left(CacheFailure('No cached Popular movies found.'));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedTopRatedMovies() async {
    final cached = await homeLocalDataSource
        .getTopRatedMovies(AppConstants.kTopRatedMoviesBoxName);

    if (cached.isNotEmpty) {
      return Right(
        DisplayDifferentMoviesTypesEntity(
          page: 1,
          dates: null,
          results: cached,
        ),
      );
    } else {
      return const Left(CacheFailure('No cached Top Rated movies found.'));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedUpcomingMovies() async {
    final cached = await homeLocalDataSource
        .getUpcomingMovies(AppConstants.kUpcomingMoviesBoxName);

    if (cached.isNotEmpty) {
      return Right(
        DisplayDifferentMoviesTypesEntity(
          page: 1,
          dates: null,
          results: cached,
        ),
      );
    } else {
      return const Left(CacheFailure('No cached Upcoming movies found.'));
    }
  }
}
