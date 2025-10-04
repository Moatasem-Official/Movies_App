import 'package:dartz/dartz.dart';
import 'package:movies_app/features/see_all_movies/data/datasource/see_all_local_data_source.dart';
import 'package:movies_app/features/see_all_movies/data/datasource/see_all_remote_data_source.dart';
import 'package:movies_app/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/exceptions/failure_mapper.dart';
import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';

class SeeAllFeatureDataRepo extends SeeAllFeatureDomainRepo {
  final SeeAllRemoteDataSource seeAllRemoteDataSource;
  final SeeAllLocalDataSource seeAllLocalDataSource;

  SeeAllFeatureDataRepo(
      {required this.seeAllRemoteDataSource,
      required this.seeAllLocalDataSource});
  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSeeAllMovies({
    required String movieType,
    int page = 1,
  }) async {
    try {
      final model = await seeAllRemoteDataSource.getSeeAllMovies(
          movieType: movieType, page: page);
      await seeAllLocalDataSource.cacheMovies(
        model.results,
        movieType,
      );
      return Right(model);
    } on NetworkException catch (e) {
      final cached = await seeAllLocalDataSource.getAllMovies(movieType);
      if (cached.isNotEmpty) {
        return Right(
          DisplayDifferentMoviesTypesEntity(
            page: page,
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
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSimilarMovies(
      {required int movieId, int page = 1}) async {
    try {
      return Right(
        await seeAllRemoteDataSource.getSimilarMovies(
            movieId: movieId, page: page),
      );
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedSeeAllMovies({
    required String movieType,
  }) async {
    final cached = await seeAllLocalDataSource.getAllMovies(movieType);
    if (cached.isNotEmpty) {
      return Right(DisplayDifferentMoviesTypesEntity(
        page: 1,
        dates: null,
        results: cached,
      ));
    }
    return const Left(CacheFailure(
      'No movies found in cache',
    ));
  }
}
