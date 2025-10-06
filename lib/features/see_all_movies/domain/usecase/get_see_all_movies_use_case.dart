import 'package:dartz/dartz.dart';
import '../repository/see_all_feature_domain_repo.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';

class GetSeeAllMoviesUseCase {
  final SeeAllFeatureDomainRepo seeAllFeatureDomainRepo;
  GetSeeAllMoviesUseCase({required this.seeAllFeatureDomainRepo});

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required String movieType,
    int page = 1,
  }) =>
      seeAllFeatureDomainRepo.getSeeAllMovies(movieType: movieType, page: page);
}
