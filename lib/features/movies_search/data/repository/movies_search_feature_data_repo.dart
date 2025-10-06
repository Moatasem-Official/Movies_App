import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/exceptions/failure_mapper.dart';
import '../../../../core/errors/exceptions/network_exception.dart';
import '../../../../core/errors/failure.dart';
import '../datasource/movies_search_remote_data_source.dart';
import '../../domain/repository/movies_search_feature_domain_repo.dart';

class MoviesSearchFeatureDataRepo extends MoviesSearchFeatureDomainRepo {
  final MoviesSearchRemoteDataSource moviesSearchRemoteDataSource;
  MoviesSearchFeatureDataRepo(this.moviesSearchRemoteDataSource);
  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> searchMovies({
    required String query,
    int page = 1,
    required String apiKey,
  }) async {
    try {
      return Right(
        await moviesSearchRemoteDataSource.searchMovies(
            query: query, page: page, apiKey: apiKey),
      );
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
