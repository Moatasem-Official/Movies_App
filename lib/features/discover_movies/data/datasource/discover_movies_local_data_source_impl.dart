import 'package:hive/hive.dart';
import 'package:movies_app/features/discover_movies/data/datasource/discover_movies_local_data_source.dart';
import 'package:movies_app/features/discover_movies/data/models/cached_category_genre_model.dart';
import 'package:movies_app/features/discover_movies/domain/entities/category_genre_entity.dart';

class DiscoverMoviesLocalDataSourceImpl extends DiscoverMoviesLocalDataSource {
  @override
  Future<void> cacheMovies(
      List<CategoryGenreEntity> moviesGenres, String boxName) async {
    final box = await Hive.openBox<CachedCategoryGenreModel>(boxName);
    await box.clear();
    await box.addAll(moviesGenres.map((genre) =>
        CachedCategoryGenreModel.fromEntity(name: genre.name, id: genre.id)));
  }

  @override
  Future<List<CategoryGenreEntity>> getAllMoviesCategories(
      String boxName) async {
    final box = await Hive.openBox<CachedCategoryGenreModel>(boxName);
    return box.values.map((genre) => genre.toEntity()).toList();
  }
}
