import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/Movies/features/home/data/datasource/home_remote_data_source.dart';
import 'package:movies_app/Movies/features/home/data/repository/different_movies_types_data_repo.dart';
import 'package:movies_app/Movies/features/home/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movie_Details_Screen/get_movie_details_use_case.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movie_Details_Screen/get_movie_videos_use_case.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movie_Details_Screen/get_similar_movies_use_case.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_now_playing_movies_use_case.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_popular_movies_use_case.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_top_rated_movies_use_case.dart';
import 'package:movies_app/Movies/features/home/domain/usecases/Movies_Home_Screen/get_upcomming_movies_use_case.dart';
import 'package:movies_app/Movies/features/home/presentation/controllers/movie_details_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/Movies/features/home/presentation/controllers/movie_details_screen/cubits/movie_videos_cubit.dart';
import 'package:movies_app/Movies/features/home/presentation/controllers/movies_home_screen/cubits/now_playing_movies_cubit.dart';
import 'package:movies_app/Movies/features/home/presentation/controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import 'package:movies_app/Movies/features/home/presentation/controllers/movie_details_screen/cubits/similar_movies_cubit.dart';
import 'package:movies_app/Movies/features/home/presentation/controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import 'package:movies_app/Movies/features/home/presentation/controllers/movies_home_screen/cubits/upcomming_movies_cubit.dart';
import 'package:movies_app/Movies/features/see_all_movies/data/datasource/see_all_remote_data_source.dart';
import 'package:movies_app/Movies/features/see_all_movies/data/repository/see_all_feature_data_repo.dart';
import 'package:movies_app/Movies/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';
import 'package:movies_app/Movies/features/see_all_movies/domain/usecase/get_see_all_movies_use_case.dart';
import 'package:movies_app/Movies/features/see_all_movies/presentation/controllers/cubit/see_all_movies_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupMoviesInjection() {
  getIt.registerLazySingleton<Dio>(() => getDioInfo());

  getIt.registerSingleton(HomeRemoteDataSource(getIt<Dio>()));
  getIt.registerSingleton(SeeAllRemoteDataSource(getIt<Dio>()));

  getIt.registerSingleton<HomeFeatureDataRepo>(
    HomeFeatureDataRepo(getIt<HomeRemoteDataSource>()),
  );

  getIt.registerSingleton<SeeAllFeatureDataRepo>(
    SeeAllFeatureDataRepo(getIt<SeeAllRemoteDataSource>()),
  );

  getIt.registerSingleton<HomeFeatureDomainRepo>(getIt<HomeFeatureDataRepo>());

  getIt.registerSingleton<SeeAllFeatureDomainRepo>(
    getIt<SeeAllFeatureDataRepo>(),
  );

  getIt.registerSingleton<GetNowPlayingMoviesUseCase>(
    GetNowPlayingMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );
  getIt.registerSingleton<GetTopRatedMoviesUseCase>(
    GetTopRatedMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetPopularMoviesUseCase>(
    GetPopularMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetUpcommingMoviesUseCase>(
    GetUpcommingMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetSeeAllMoviesUseCase>(
    GetSeeAllMoviesUseCase(
      seeAllFeatureDomainRepo: getIt<SeeAllFeatureDomainRepo>(),
    ),
  );

  getIt.registerSingleton<GetMovieDetailsUseCase>(
    GetMovieDetailsUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetSimilarMoviesUseCase>(
    GetSimilarMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetMovieVideosUseCase>(
    GetMovieVideosUseCase(getIt<HomeFeatureDomainRepo>()),
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

  getIt.registerFactory<SeeAllMoviesCubit>(
    () => SeeAllMoviesCubit(getIt<GetSeeAllMoviesUseCase>()),
  );

  getIt.registerFactory<MovieDetailsCubit>(
    () => MovieDetailsCubit(getIt<GetMovieDetailsUseCase>()),
  );

  getIt.registerFactory<SimilarMoviesCubit>(
    () => SimilarMoviesCubit(getIt<GetSimilarMoviesUseCase>()),
  );

  getIt.registerFactory<MovieVideosCubit>(
    () => MovieVideosCubit(getIt<GetMovieVideosUseCase>()),
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
