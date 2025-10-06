import 'package:dartz/dartz.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../repository/home_feature_domain_repo.dart';
import '../../../../../core/errors/failure.dart';

class GetTopRatedMoviesUseCase {
  final HomeFeatureDomainRepo homeFeatureDomainRepo;
  GetTopRatedMoviesUseCase(this.homeFeatureDomainRepo);
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    int page = 1,
  }) =>
      homeFeatureDomainRepo.getTopRatedMovies(page: page);
}
