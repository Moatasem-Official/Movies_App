import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repository/discover_movies_feature_domain_repo.dart';

class GetCategoryMoviesUseCase {
  final DiscoverMoviesFeatureDomainRepo discoverMoviesFeatureDomainRepo;
  GetCategoryMoviesUseCase(this.discoverMoviesFeatureDomainRepo);

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call(
          {required int genreId, int page = 1}) async =>
      await discoverMoviesFeatureDomainRepo.getcategoryMovies(
          genreId: genreId, page: page);
}
