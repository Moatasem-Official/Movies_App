import 'package:dartz/dartz.dart';
import '../repository/movie_videos_feature_domain_repo.dart';
import '../../../../core/entities/movie_videos_entity.dart';
import '../../../../core/errors/failure.dart';

class GetAllMovieVideosUseCase {
  final MovieVideosFeatureDomainRepo movieVideosFeatureDomainRepo;
  GetAllMovieVideosUseCase(this.movieVideosFeatureDomainRepo);

  Future<Either<Failure, MovieVideosEntity>> call({
    required int movieId,
  }) async =>
      await movieVideosFeatureDomainRepo.getMovieVideos(movieId: movieId);
}
