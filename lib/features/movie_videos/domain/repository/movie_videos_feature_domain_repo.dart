import 'package:dartz/dartz.dart';
import '../../../../core/entities/movie_videos_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class MovieVideosFeatureDomainRepo {
  Future<Either<Failure, MovieVideosEntity>> getMovieVideos({
    required int movieId,
  });
}
