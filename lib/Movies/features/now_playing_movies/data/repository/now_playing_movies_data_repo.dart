import 'package:movies_app/Movies/features/now_playing_movies/domain/entities/now_playing_movies_entity.dart';
import 'package:movies_app/Movies/features/now_playing_movies/domain/repository/now_playing_movies_domain_repo.dart';

class NowPlayingMoviesDataRepo implements NowPlayingMoviesDomainRepo {
  @override
  Future<NowplayingMoviesEntity> getNowPlayingMovies() async {}
}
