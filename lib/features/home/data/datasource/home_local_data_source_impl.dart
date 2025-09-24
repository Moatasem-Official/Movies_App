import 'package:hive/hive.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/home/data/datasource/home_local_data_source.dart';
import 'package:movies_app/features/home/data/models/cached_movies_model.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  Future<List<ResultEntity>> getNowPlayingMovies(String boxName) async {
    final box = await Hive.openBox<CachedMoviesModel>(boxName);
    return box.values.map((cached) => cached.toEntity()).toList();
  }

  @override
  Future<List<ResultEntity>> getPopularMovies(String boxName) async {
    final box = await Hive.openBox<CachedMoviesModel>(boxName);
    return box.values.map((cached) => cached.toEntity()).toList();
  }

  @override
  Future<List<ResultEntity>> getTopRatedMovies(String boxName) async {
    final box = await Hive.openBox<CachedMoviesModel>(boxName);
    return box.values.map((cached) => cached.toEntity()).toList();
  }

  @override
  Future<List<ResultEntity>> getUpcomingMovies(String boxName) async {
    final box = await Hive.openBox<CachedMoviesModel>(boxName);
    return box.values.map((cached) => cached.toEntity()).toList();
  }

  @override
  Future<void> cacheMovies(List<ResultEntity> movies, String boxName) async {
    final box = await Hive.openBox<CachedMoviesModel>(boxName);
    await box.clear();
    await box
        .addAll(movies.map((movie) => CachedMoviesModel.fromEntity(movie)));
  }
}
