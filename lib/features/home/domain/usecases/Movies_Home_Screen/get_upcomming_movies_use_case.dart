import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/home/domain/repository/home_feature_domain_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetUpcommingMoviesUseCase {
  final HomeFeatureDomainRepo homeFeatureDomainRepo;
  GetUpcommingMoviesUseCase(this.homeFeatureDomainRepo);
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    int page = 1,
  }) =>
      homeFeatureDomainRepo.getUpcomingMovies(page: page);
}
