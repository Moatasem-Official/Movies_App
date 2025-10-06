import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movies_categories_entity.dart';
import '../repository/discover_movies_feature_domain_repo.dart';

class GetCachedDiscoverMoviesUseCase {
  final DiscoverMoviesFeatureDomainRepo discoverMoviesFeatureDomainRepo;
  GetCachedDiscoverMoviesUseCase(this.discoverMoviesFeatureDomainRepo);
  Future<Either<Failure, MoviesCategoriesEntity>> call() async =>
      await discoverMoviesFeatureDomainRepo.getCachedDiscoverMovies();
}
