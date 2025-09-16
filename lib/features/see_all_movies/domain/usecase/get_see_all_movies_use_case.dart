import 'package:dartz/dartz.dart';
import 'package:movies_app/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetSeeAllMoviesUseCase {
  final SeeAllFeatureDomainRepo seeAllFeatureDomainRepo;
  GetSeeAllMoviesUseCase({required this.seeAllFeatureDomainRepo});

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required String movieType,
    int page = 1,
  }) =>
      seeAllFeatureDomainRepo.getSeeAllMovies(movieType: movieType, page: page);
}
