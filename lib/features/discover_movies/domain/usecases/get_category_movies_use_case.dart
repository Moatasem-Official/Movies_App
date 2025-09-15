import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/discover_movies/domain/repository/discover_movies_feature_domain_repo.dart';

class GetCategoryMoviesUseCase {
  final DiscoverMoviesFeatureDomainRepo discoverMoviesFeatureDomainRepo;
  GetCategoryMoviesUseCase(this.discoverMoviesFeatureDomainRepo);

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call(
          int genreId, int page) async =>
      await discoverMoviesFeatureDomainRepo.getcategoryMovies(genreId, page);
}
