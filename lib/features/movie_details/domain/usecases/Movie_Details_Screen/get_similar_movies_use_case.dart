import 'package:dartz/dartz.dart';
import '../../repository/movie_details_feature_domain_repo.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../core/errors/failure.dart';

class GetSimilarMoviesUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;
  GetSimilarMoviesUseCase(this.movieDetailsFeatureDomainRepo);

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required int movieId,
    int page = 1,
  }) =>
      movieDetailsFeatureDomainRepo.getSimilarMovies(
          movieId: movieId, page: page);
}
