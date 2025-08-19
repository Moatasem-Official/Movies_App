import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetTopRatedMoviesUseCase {
  final DifferentMoviesTypesDomainRepo differentMoviesTypesDomainRepo;
  GetTopRatedMoviesUseCase(this.differentMoviesTypesDomainRepo);
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call() =>
      differentMoviesTypesDomainRepo.getTopRatedMovies();
}
