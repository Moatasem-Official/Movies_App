import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';

abstract class DifferentMoviesTypesDomainRepo {
  Future<DisplayDifferentMoviesTypesEntity> getNowPlayingMovies();
  Future<DisplayDifferentMoviesTypesEntity> getPopularMovies();
  Future<DisplayDifferentMoviesTypesEntity> getTopRatedMovies();
}
