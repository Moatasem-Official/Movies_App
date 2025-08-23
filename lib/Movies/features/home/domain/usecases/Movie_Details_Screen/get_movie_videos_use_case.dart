import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/home/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/home/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetMovieVideosUseCase {
  GetMovieVideosUseCase(this.homeFeatureDomainRepo);
  final HomeFeatureDomainRepo homeFeatureDomainRepo;

  Future<Either<Failure, MovieVideosEntity>> call({required int movieId}) =>
      homeFeatureDomainRepo.getMovieVideos(movieId: movieId);
}
