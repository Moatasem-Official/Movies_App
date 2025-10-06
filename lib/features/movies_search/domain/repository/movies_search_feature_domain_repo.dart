import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class MoviesSearchFeatureDomainRepo {
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> searchMovies({
    required String query,
    int page = 1,
    required String apiKey,
  });
}
