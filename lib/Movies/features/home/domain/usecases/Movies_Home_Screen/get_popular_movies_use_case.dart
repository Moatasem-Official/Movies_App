import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/repository/home_feature_domain_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetPopularMoviesUseCase {
  final HomeFeatureDomainRepo homeFeatureDomainRepo;
  GetPopularMoviesUseCase(this.homeFeatureDomainRepo);
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call() =>
      homeFeatureDomainRepo.getPopularMovies();
}
