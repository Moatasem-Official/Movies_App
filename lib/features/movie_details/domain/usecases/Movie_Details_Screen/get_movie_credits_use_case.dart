import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../entities/movie_credits_entity.dart';
import '../../repository/movie_details_feature_domain_repo.dart';

class GetMovieCreditsUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;

  GetMovieCreditsUseCase({required this.movieDetailsFeatureDomainRepo});

  Future<Either<Failure, MovieCreditsEntity>> call({required int movieId}) {
    return movieDetailsFeatureDomainRepo.getMovieCredits(movieId: movieId);
  }
}
