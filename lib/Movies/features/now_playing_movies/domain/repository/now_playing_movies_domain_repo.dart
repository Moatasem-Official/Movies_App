import 'package:movies_app/Movies/features/now_playing_movies/domain/entities/now_playing_movies_entity.dart';

abstract class NowPlayingMoviesDomainRepo {
  Future<NowplayingMoviesEntity> getNowPlayingMovies();
}
