import 'package:hive/hive.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/utils/app_constants.dart';
import 'movies_watch_list_local_data_source.dart';
import '../models/hive_movie_model.dart';

class MoviesWatchListLocalDataSourceImpl
    implements MoviesWatchListLocalDataSource {
  @override
  Future<Box<HiveMovieModel>> openBox() async {
    return await Hive.openBox<HiveMovieModel>(AppConstants.watchListBoxName);
  }

  @override
  Future<void> addMovie(ResultEntity movie) async {
    final box = await openBox();
    final hiveMovie = HiveMovieModel.fromEntity(movie);
    await box.put(movie.id, hiveMovie);
  }

  @override
  Future<void> removeMovie(int movieId) async {
    final box = await openBox();
    await box.delete(movieId);
  }

  @override
  Future<void> clearWatchList() async {
    final box = await openBox();
    await box.clear();
  }

  @override
  Future<List<ResultEntity>> getWatchList() async {
    final box = await openBox();
    return box.values.map((hiveMovie) => hiveMovie.toEntity()).toList();
  }
}
