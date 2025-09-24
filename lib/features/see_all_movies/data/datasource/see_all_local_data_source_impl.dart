import 'package:hive/hive.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/see_all_movies/data/datasource/see_all_local_data_source.dart';
import 'package:movies_app/features/see_all_movies/data/models/cached_see_all_movies_model.dart';

class SeeAllLocalDataSourceImpl extends SeeAllLocalDataSource {
  @override
  Future<void> cacheMovies(List<ResultEntity> movies, String boxName) async {
    final box = await Hive.openBox<CachedSeeAllMoviesModel>(boxName);
    await box.clear();
    await box.addAll(
        movies.map((movie) => CachedSeeAllMoviesModel.fromEntity(movie)));
  }

  @override
  Future<List<ResultEntity>> getAllMovies(String boxName) async {
    final box = await Hive.openBox<CachedSeeAllMoviesModel>(boxName);
    return box.values.map((movie) => movie.toEntity()).toList();
  }
}
