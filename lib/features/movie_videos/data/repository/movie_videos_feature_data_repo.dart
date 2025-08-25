import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_videos/data/datasource/movie_videos_remote_data_source.dart';
import 'package:movies_app/features/movie_videos/domain/repository/movie_videos_feature_domain_repo.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/errors/exceptions/failure_mapper.dart';
import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';

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
