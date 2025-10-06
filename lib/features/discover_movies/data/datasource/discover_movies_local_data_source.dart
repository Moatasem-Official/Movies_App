import '../../domain/entities/category_genre_entity.dart';

abstract class DiscoverMoviesLocalDataSource {
  Future<void> cacheMovies(
      List<CategoryGenreEntity> moviesGenres, String boxName);
  Future<List<CategoryGenreEntity>> getAllMoviesCategories(String boxName);
}
