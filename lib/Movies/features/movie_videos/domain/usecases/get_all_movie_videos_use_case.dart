import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/movie_videos/domain/repository/movie_videos_feature_domain_repo.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetAllMovieVideosUseCase {
  final MovieVideosFeatureDomainRepo movieVideosFeatureDomainRepo;
  GetAllMovieVideosUseCase(this.movieVideosFeatureDomainRepo);

  Future<Either<Failure, MovieVideosEntity>> call({
    required int movieId,
    required int page,
  }) async => await movieVideosFeatureDomainRepo.getMovieVideos(
    movieId: movieId,
    page: page,
  );
}
