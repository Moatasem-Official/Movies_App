import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movies_search/domain/repository/movies_search_feature_domain_repo.dart';

class GetSearchedMoviesUseCase {
  final MoviesSearchFeatureDomainRepo moviesSearchFeatureDomainRepo;
  GetSearchedMoviesUseCase(this.moviesSearchFeatureDomainRepo);

  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call({
    required String query,
    int page = 1,
    required String apiKey,
  }) async =>
      await moviesSearchFeatureDomainRepo.searchMovies(
        query: query,
        page: page,
        apiKey: apiKey,
      );
}
