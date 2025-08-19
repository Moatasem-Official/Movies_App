import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/datasource/remote_data_source.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/repository/different_movies_types_data_repo.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/get_now_playing_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubit/movies_home_screen_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupMoviesInjection() {
  getIt.registerSingleton(RemoteDataSource(getDioInfo()));

  getIt.registerSingleton<DifferentMoviesTypesDataRepo>(
    DifferentMoviesTypesDataRepo(getIt<RemoteDataSource>()),
  );

  getIt.registerSingleton<DifferentMoviesTypesDomainRepo>(
    getIt<DifferentMoviesTypesDataRepo>(),
  );

  getIt.registerSingleton<GetNowPlayingMoviesUseCase>(
    GetNowPlayingMoviesUseCase(getIt<DifferentMoviesTypesDomainRepo>()),
  );

  getIt.registerFactory<MoviesHomeScreenCubit>(
    () => MoviesHomeScreenCubit(getIt<GetNowPlayingMoviesUseCase>()),
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
