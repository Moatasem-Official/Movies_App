import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/home/domain/entities/movie_details_entity.dart';
import 'package:movies_app/Movies/features/home/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/failure.dart';

class GetMovieDetailsUseCase {
  final HomeFeatureDomainRepo homeFeatureDomainRepo;
  GetMovieDetailsUseCase(this.homeFeatureDomainRepo);

  Future<Either<Failure, MovieDetailsEntity>> call({required int movieId}) =>
      homeFeatureDomainRepo.getMovieDetails(movieId: movieId);
}
