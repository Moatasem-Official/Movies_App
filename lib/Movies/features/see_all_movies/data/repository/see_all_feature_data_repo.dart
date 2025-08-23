import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/see_all_movies/data/datasource/see_all_remote_data_source.dart';
import 'package:movies_app/Movies/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/error/exceptions/failure_mapper.dart';
import 'package:movies_app/core/error/exceptions/network_exception.dart';
import 'package:movies_app/core/error/failure.dart';

class SeeAllFeatureDataRepo extends SeeAllFeatureDomainRepo {
  final SeeAllRemoteDataSource seeAllRemoteDataSource;

  SeeAllFeatureDataRepo(this.seeAllRemoteDataSource);
  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSeeAllMovies({
    required String movieType,
    required int page,
  }) async {
    try {
      return Right(
        await seeAllRemoteDataSource.getSeeAllMovies(movieType, page),
      );
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
