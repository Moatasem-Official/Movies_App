// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';

import 'package:movies_app/core/errors/exceptions/failure_mapper.dart';
import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/discover_movies/data/datasource/discover_movies_local_data_source.dart';
import 'package:movies_app/features/discover_movies/data/datasource/discover_movies_remote_data_source.dart';
import 'package:movies_app/features/discover_movies/domain/entities/movies_categories_entity.dart';
import 'package:movies_app/features/discover_movies/domain/repository/discover_movies_feature_domain_repo.dart';

class DiscoverMoviesFeatureDataRepo extends DiscoverMoviesFeatureDomainRepo {
  final DiscoverMoviesRemoteDataSource discoverMoviesRemoteDataSource;
  final DiscoverMoviesLocalDataSource discoverMoviesLocalDataSource;
  DiscoverMoviesFeatureDataRepo({
    required this.discoverMoviesRemoteDataSource,
    required this.discoverMoviesLocalDataSource,
  });
  @override
  Future<Either<Failure, MoviesCategoriesEntity>> getDiscoverMovies() async {
    try {
      final model = await discoverMoviesRemoteDataSource.getDiscoverMovies();
      await discoverMoviesLocalDataSource.cacheMovies(
          model.genres, AppConstants.kDiscoverMoviesCategoriesBoxName);
      return Right(model);
    } on NetworkException catch (e) {
      final cached = await discoverMoviesLocalDataSource.getAllMoviesCategories(
          AppConstants.kDiscoverMoviesCategoriesBoxName);
      if (cached.isNotEmpty) {
        return Right(MoviesCategoriesEntity(genres: cached));
      }
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getcategoryMovies({
    required int genreId,
    int page = 1,
  }) async {
    try {
      final result = await discoverMoviesRemoteDataSource.getcategoryMovies(
          genreId: genreId, page: page);
      return Right(result);
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
