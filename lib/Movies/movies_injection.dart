import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/features/now_playing_movies/data/datasource/remote_data_source.dart';
import 'package:movies_app/Movies/features/now_playing_movies/data/repository/now_playing_movies_data_repo.dart';
import 'package:movies_app/Movies/features/now_playing_movies/domain/repository/now_playing_movies_domain_repo.dart';
import 'package:movies_app/Movies/features/now_playing_movies/domain/usecases/get_now_playing_movies_use_case.dart';

final GetIt getIt = GetIt.instance;

void setupMoviesInjection() {
  getIt.registerSingleton(RemoteDataSource(getDioInfo()));
  getIt.registerSingleton(NowPlayingMoviesDataRepo(getIt<RemoteDataSource>()));
  getIt.registerSingleton(
    GetNowPlayingMoviesUseCase(getIt<NowPlayingMoviesDomainRepo>()),
  );
}

Dio getDioInfo() {
  Dio dio = Dio();
  dio.interceptors.add(
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
      request: true,
      logPrint: (object) => print(object),
      requestHeader: true,
      responseHeader: true,
    ),
  );
  return dio;
}
