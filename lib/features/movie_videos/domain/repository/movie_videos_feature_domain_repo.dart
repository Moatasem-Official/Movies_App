import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

abstract class MovieVideosFeatureDomainRepo {
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  });
}
