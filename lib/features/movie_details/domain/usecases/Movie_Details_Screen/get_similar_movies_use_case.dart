import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetSimilarMoviesUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;
  GetSimilarMoviesUseCase(this.movieDetailsFeatureDomainRepo);

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required int movieId,
  }) => movieDetailsFeatureDomainRepo.getSimilarMovies(movieId: movieId);
}
