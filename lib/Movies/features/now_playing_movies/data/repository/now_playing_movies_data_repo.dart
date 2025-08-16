import 'package:movies_app/Movies/features/now_playing_movies/data/datasource/remote_data_source.dart';
import 'package:movies_app/Movies/features/now_playing_movies/domain/entities/now_playing_movies_entity.dart';
import 'package:movies_app/Movies/features/now_playing_movies/domain/repository/now_playing_movies_domain_repo.dart';

class NowPlayingMoviesDataRepo implements NowPlayingMoviesDomainRepo {
  final RemoteDataSource remoteDataSource;
  NowPlayingMoviesDataRepo(this.remoteDataSource);

  @override
  Future<NowplayingMoviesEntity> getNowPlayingMovies() async {
    return await remoteDataSource.getNowPlayingMovies();
  }
}
