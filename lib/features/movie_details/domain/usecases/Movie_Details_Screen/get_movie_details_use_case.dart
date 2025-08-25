import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetMovieDetailsUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;
  GetMovieDetailsUseCase(this.movieDetailsFeatureDomainRepo);

  Future<Either<Failure, MovieDetailsEntity>> call({required int movieId}) =>
      movieDetailsFeatureDomainRepo.getMovieDetails(movieId: movieId);
}
