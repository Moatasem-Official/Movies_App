import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetSimilarMoviesUseCase {
  final HomeFeatureDomainRepo homeFeatureDomainRepo;
  GetSimilarMoviesUseCase(this.homeFeatureDomainRepo);

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required int movieId,
  }) => homeFeatureDomainRepo.getSimilarMovies(movieId: movieId);
}
