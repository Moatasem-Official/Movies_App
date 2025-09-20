import 'package:hive/hive.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/watch_list/data/models/hive_movie_model.dart';

abstract class MoviesWatchListLocalDataSource {
  Future<Box<HiveMovieModel>> openBox();

  Future<void> addMovie(ResultEntity movie);

  Future<void> removeMovie(int movieId);

  Future<void> clearWatchList();

  Future<List<ResultEntity>> getWatchList();
}
