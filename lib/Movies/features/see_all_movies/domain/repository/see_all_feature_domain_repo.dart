import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class SeeAllFeatureDomainRepo {
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getSeeAllMovies({
    required String movieType,
    required int page,
  });
}
