import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/movie_details/data/datasource/movie_details_remote_data_source.dart';
import 'package:movies_app/Movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/exceptions/failure_mapper.dart';
import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';

class MovieDetailsFeatureDataRepo extends MovieDetailsFeatureDomainRepo {
  final MovieDetailsRemoteDataSource movieDetailsRemoteDataSource;

  MovieDetailsFeatureDataRepo(this.movieDetailsRemoteDataSource);
  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails({
    required int movieId,
  }) async {
    try {
      return Right(await movieDetailsRemoteDataSource.getMovieDetails(movieId));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSimilarMovies({
    required int movieId,
  }) async {
    try {
      return Right(
        await movieDetailsRemoteDataSource.getSimilarMovies(movieId),
      );
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }

  @override
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  }) async {
    try {
      return Right(await movieDetailsRemoteDataSource.getMovieVideos(movieId));
    } on NetworkException catch (e) {
      final exception = NetworkException.getDioException(e);
      return Left(FailureMapper.mapExceptionToFailure(exception));
    }
  }
}
