import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class SeeAllFeatureDomainRepo {
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSeeAllMovies({
    required String movieType,
    int page = 1,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSimilarMovies({
    required int movieId,
    int page = 1,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedSeeAllMovies({required String movieType});
}
