import '../../../../core/entities/display_different_movies_types_entity.dart';

abstract class SeeAllLocalDataSource {
  Future<void> cacheMovies(List<ResultEntity> movies, String boxName);
  Future<List<ResultEntity>> getAllMovies(String boxName);
}
