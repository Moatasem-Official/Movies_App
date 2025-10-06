import 'package:dartz/dartz.dart';
import '../datasource/movie_videos_remote_data_source.dart';
import '../../domain/repository/movie_videos_feature_domain_repo.dart';
import '../../../../core/entities/movie_videos_entity.dart';
import '../../../../core/errors/exceptions/failure_mapper.dart';
import '../../../../core/errors/exceptions/network_exception.dart';
import '../../../../core/errors/failure.dart';

class MovieVideosFeatureDataRepo extends MovieVideosFeatureDomainRepo {
  final MovieVideosRemoteDataSource movieVideosRemoteDataSource;

  MovieVideosFeatureDataRepo(this.movieVideosRemoteDataSource);

  @override
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  }) async {
    try {
      return Right(await movieVideosRemoteDataSource.getMovieVideos(movieId));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
