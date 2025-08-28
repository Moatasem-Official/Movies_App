import 'package:hive/hive.dart';
import 'package:movies_app/core/models/result_model.dart';

class MoviesWatchListLocalDataSource {
  static const String watchListBoxName = "movies_watchlist";

  Future<Box<ResultModel>> _openBox() async {
    return await Hive.openBox<ResultModel>(watchListBoxName);
  }

  Future<void> addMovie(ResultModel movie) async {
    final box = await _openBox();
    await box.put(movie.id, movie);
  }

  Future<void> removeMovie(int movieId) async {
    final box = await _openBox();
    await box.delete(movieId);
  }

  Future<void> clearWatchList() async {
    final box = await _openBox();
    await box.clear();
  }

  Future<List<ResultModel>> getWatchList() async {
    final box = await _openBox();
    return box.values.toList();
  }

  Future<bool> isMovieInWatchList(int movieId) async {
    final box = await _openBox();
    return box.containsKey(movieId);
  }
}
