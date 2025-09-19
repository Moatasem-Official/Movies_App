import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';

class GetMovieSimilarMoviesUseCase {
  final SeeAllFeatureDomainRepo seeAllFeatureDomainRepo;
  GetMovieSimilarMoviesUseCase({required this.seeAllFeatureDomainRepo});

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call(
          {required int movieId, int page = 1}) =>
      seeAllFeatureDomainRepo.getSimilarMovies(movieId: movieId, page: page);
}
