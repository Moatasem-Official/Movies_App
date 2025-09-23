import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';

abstract class HomeLocalDataSource {
  List<ResultEntity> getNowPlayingMovies();
  List<ResultEntity> getPopularMovies();
  List<ResultEntity> getTopRatedMovies();
  List<ResultEntity> getUpcomingMovies();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<ResultEntity> getNowPlayingMovies() {}

  @override
  List<ResultEntity> getPopularMovies() {}

  @override
  List<ResultEntity> getTopRatedMovies() {}

  @override
  List<ResultEntity> getUpcomingMovies() {}
}
