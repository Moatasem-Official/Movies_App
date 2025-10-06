import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';
import '../entities/movies_categories_entity.dart';

abstract class DiscoverMoviesFeatureDomainRepo {
  Future<Either<Failure, MoviesCategoriesEntity>> getDiscoverMovies();
  Future<Either<Failure, MoviesCategoriesEntity>> getCachedDiscoverMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getcategoryMovies(
      {required int genreId, int page = 1});
}
