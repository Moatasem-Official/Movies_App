import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';

abstract class HomeLocalDataSource {
  Future<void> cacheMovies(List<ResultEntity> movies, String boxName);
  Future<List<ResultEntity>> getNowPlayingMovies(String boxName);
  Future<List<ResultEntity>> getPopularMovies(String boxName);
  Future<List<ResultEntity>> getTopRatedMovies(String boxName);
  Future<List<ResultEntity>> getUpcomingMovies(String boxName);
}
