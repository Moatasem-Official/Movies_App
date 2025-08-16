import 'package:movies_app/Movies/features/display_different_movies_types/data/datasource/remote_data_source.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';

class NowPlayingMoviesDataRepo implements DifferentMoviesTypesDomainRepo {
  final RemoteDataSource remoteDataSource;
  NowPlayingMoviesDataRepo(this.remoteDataSource);

  @override
  Future<DisplayDifferentMoviesTypesEntity> getNowPlayingMovies() async {
    return await remoteDataSource.getNowPlayingMovies();
  }
}
