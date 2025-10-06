import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repository/see_all_feature_domain_repo.dart';

class GetCachedSeeAllMoviesUseCase {
  final SeeAllFeatureDomainRepo seeAllFeatureDomainRepo;
  GetCachedSeeAllMoviesUseCase({required this.seeAllFeatureDomainRepo});

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required String movieType,
  }) =>
      seeAllFeatureDomainRepo.getCachedSeeAllMovies(movieType: movieType);
}
