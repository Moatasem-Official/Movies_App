import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetMovieVideosUseCase {
  GetMovieVideosUseCase(this.movieDetailsFeatureDomainRepo);
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;

  Future<Either<Failure, MovieVideosEntity>> call({required int movieId}) =>
      movieDetailsFeatureDomainRepo.getMovieVideos(movieId: movieId);
}
