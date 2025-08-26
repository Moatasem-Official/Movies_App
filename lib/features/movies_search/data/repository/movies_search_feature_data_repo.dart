import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/exceptions/failure_mapper.dart';
import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movies_search/data/datasource/movies_search_remote_data_source.dart';
import 'package:movies_app/features/movies_search/domain/repository/movies_search_feature_domain_repo.dart';

class MoviesSearchFeatureDataRepo extends MoviesSearchFeatureDomainRepo {
  final MoviesSearchRemoteDataSource moviesSearchRemoteDataSource;
  MoviesSearchFeatureDataRepo(this.moviesSearchRemoteDataSource);
  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> searchMovies({
    required String query,
    required int page,
    required String apiKey,
  }) async {
    try {
      return Right(
        await moviesSearchRemoteDataSource.searchMovies(query, page, apiKey),
      );
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
