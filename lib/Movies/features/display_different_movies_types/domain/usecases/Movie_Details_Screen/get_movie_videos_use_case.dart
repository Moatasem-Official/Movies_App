import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_videos_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetMovieVideosUseCase {
  GetMovieVideosUseCase(this.differentMoviesTypesDomainRepo);
  final DifferentMoviesTypesDomainRepo differentMoviesTypesDomainRepo;

  Future<Either<Failure, MovieVideosEntity>> call({required int movieId}) =>
      differentMoviesTypesDomainRepo.getMovieVideos(movieId: movieId);
}
