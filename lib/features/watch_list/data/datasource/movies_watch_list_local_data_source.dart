import 'package:hive/hive.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/watch_list/data/models/hive_movie_model.dart';

class MoviesWatchListLocalDataSource {
  static const String watchListBoxName = "movies_watchlist";

  Future<Box<HiveMovieModel>> _openBox() async {
    return await Hive.openBox<HiveMovieModel>(watchListBoxName);
  }

  Future<void> addMovie(ResultEntity movie) async {
    final box = await _openBox();
    final hiveMovie = HiveMovieModel.fromEntity(movie);
    await box.put(movie.id, hiveMovie);
  }

  Future<void> removeMovie(int movieId) async {
    final box = await _openBox();
    await box.delete(movieId);
  }

  Future<void> clearWatchList() async {
    final box = await _openBox();
    await box.clear();
  }

  Future<List<ResultEntity>> getWatchList() async {
    final box = await _openBox();
    return box.values.map((hiveMovie) => hiveMovie.toEntity()).toList();
  }
}
