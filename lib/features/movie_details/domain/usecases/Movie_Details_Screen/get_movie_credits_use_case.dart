import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_credits_entity.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';

class GetMovieCreditsUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;

  GetMovieCreditsUseCase({required this.movieDetailsFeatureDomainRepo});

  Future<Either<Failure, MovieCreditsEntity>> call({required int movieId}) {
    return movieDetailsFeatureDomainRepo.getMovieCredits(movieId: movieId);
  }
}
