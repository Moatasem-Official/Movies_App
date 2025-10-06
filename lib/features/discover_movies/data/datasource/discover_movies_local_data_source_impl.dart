import 'package:hive/hive.dart';
import 'discover_movies_local_data_source.dart';
import '../models/cached_category_genre_model.dart';
import '../../domain/entities/category_genre_entity.dart';

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
