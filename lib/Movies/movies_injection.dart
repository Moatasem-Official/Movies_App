import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/datasource/remote_data_source.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/repository/different_movies_types_data_repo.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movies_Home_Screen/get_now_playing_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movies_Home_Screen/get_popular_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movies_Home_Screen/get_top_rated_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/usecases/Movies_Home_Screen/get_upcomming_movies_use_case.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/now_playing_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/upcomming_movies_cubit.dart';

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
  getIt.registerSingleton<GetTopRatedMoviesUseCase>(
    GetTopRatedMoviesUseCase(getIt<DifferentMoviesTypesDomainRepo>()),
  );

  getIt.registerSingleton<GetPopularMoviesUseCase>(
    GetPopularMoviesUseCase(getIt<DifferentMoviesTypesDomainRepo>()),
  );

  getIt.registerSingleton<GetUpcommingMoviesUseCase>(
    GetUpcommingMoviesUseCase(getIt<DifferentMoviesTypesDomainRepo>()),
  );

  getIt.registerFactory<NowPlayingMoviesCubit>(
    () => NowPlayingMoviesCubit(getIt<GetNowPlayingMoviesUseCase>()),
  );

  getIt.registerFactory<TopRatedMoviesCubit>(
    () => TopRatedMoviesCubit(getIt<GetTopRatedMoviesUseCase>()),
  );

  getIt.registerFactory<PopularMoviesCubit>(
    () => PopularMoviesCubit(getIt<GetPopularMoviesUseCase>()),
  );

  getIt.registerFactory<UpcommingMoviesCubit>(
    () => UpcommingMoviesCubit(getIt<GetUpcommingMoviesUseCase>()),
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
