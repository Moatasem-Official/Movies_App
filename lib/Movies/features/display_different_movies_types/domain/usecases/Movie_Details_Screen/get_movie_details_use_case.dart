import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_details_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetMovieDetailsUseCase {
  final DifferentMoviesTypesDomainRepo differentMoviesTypesDataRepo;
  GetMovieDetailsUseCase(this.differentMoviesTypesDataRepo);

  Future<Either<Failure, MovieDetailsEntity>> call({required int movieId}) =>
      differentMoviesTypesDataRepo.getMovieDetails(movieId: movieId);
}
