import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/discover_movies/domain/entities/movies_categories_entity.dart';

abstract class DiscoverMoviesFeatureDomainRepo {
  Future<Either<Failure, MoviesCategoriesEntity>> getDiscoverMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getcategoryMovies(
      int genreId, int page);
}
