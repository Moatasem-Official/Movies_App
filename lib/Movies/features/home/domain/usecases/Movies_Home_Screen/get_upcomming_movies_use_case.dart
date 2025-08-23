import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/home/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetUpcommingMoviesUseCase {
  final DifferentMoviesTypesDomainRepo differentMoviesTypesDomainRepo;
  GetUpcommingMoviesUseCase(this.differentMoviesTypesDomainRepo);
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call() =>
      differentMoviesTypesDomainRepo.getUpcomingMovies();
}
