import 'package:dartz/dartz.dart';
import '../../repository/movie_details_feature_domain_repo.dart';
import '../../entities/movie_details_entity.dart';
import '../../../../../core/errors/failure.dart';

class GetMovieDetailsUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;
  GetMovieDetailsUseCase(this.movieDetailsFeatureDomainRepo);

  Future<Either<Failure, MovieDetailsEntity>> call({required int movieId}) =>
      movieDetailsFeatureDomainRepo.getMovieDetails(movieId: movieId);
}
