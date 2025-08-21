import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetSimilarMoviesUseCase {
  final DifferentMoviesTypesDomainRepo differentMoviesTypesDomainRepo;
  GetSimilarMoviesUseCase(this.differentMoviesTypesDomainRepo);

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required int movieId,
  }) => differentMoviesTypesDomainRepo.getSimilarMovies(movieId: movieId);
}
