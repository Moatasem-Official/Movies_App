import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';

class GetCachedSeeAllMoviesUseCase {
  final SeeAllFeatureDomainRepo seeAllFeatureDomainRepo;
  GetCachedSeeAllMoviesUseCase({required this.seeAllFeatureDomainRepo});

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required String movieType,
  }) =>
      seeAllFeatureDomainRepo.getCachedSeeAllMovies(movieType: movieType);
}
