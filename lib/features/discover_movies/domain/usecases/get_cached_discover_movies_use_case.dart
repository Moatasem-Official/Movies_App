import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/discover_movies/domain/entities/movies_categories_entity.dart';
import 'package:movies_app/features/discover_movies/domain/repository/discover_movies_feature_domain_repo.dart';

class GetCachedDiscoverMoviesUseCase {
  final DiscoverMoviesFeatureDomainRepo discoverMoviesFeatureDomainRepo;
  GetCachedDiscoverMoviesUseCase(this.discoverMoviesFeatureDomainRepo);
  Future<Either<Failure, MoviesCategoriesEntity>> call() async =>
      await discoverMoviesFeatureDomainRepo.getCachedDiscoverMovies();
}
