import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/errors/failure.dart';

class GetTopRatedMoviesUseCase {
  final HomeFeatureDomainRepo homeFeatureDomainRepo;
  GetTopRatedMoviesUseCase(this.homeFeatureDomainRepo);
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call() =>
      homeFeatureDomainRepo.getTopRatedMovies();
}
