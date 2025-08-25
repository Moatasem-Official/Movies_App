import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/features/home/data/datasource/home_remote_data_source.dart';
import 'package:movies_app/features/home/data/repository/home_feature_data_repo.dart';
import 'package:movies_app/features/home/domain/repository/home_feature_domain_repo.dart';
import 'package:movies_app/features/movie_details/data/datasource/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/repository/movie_details_feature_data_repo.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_details_use_case.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_videos_use_case.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_similar_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_now_playing_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_popular_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_top_rated_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_upcomming_movies_use_case.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_videos_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/now_playing_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/upcomming_movies_cubit.dart';
import 'package:movies_app/features/movie_videos/data/datasource/movie_videos_remote_data_source.dart';
import 'package:movies_app/features/movie_videos/data/repository/movie_videos_feature_data_repo.dart';
import 'package:movies_app/features/movie_videos/domain/repository/movie_videos_feature_domain_repo.dart';
import 'package:movies_app/features/movie_videos/domain/usecases/get_all_movie_videos_use_case.dart';
import 'package:movies_app/features/movie_videos/presentation/controllers/cubit/all_movie_videos_cubit.dart';
import 'package:movies_app/features/see_all_movies/data/datasource/see_all_remote_data_source.dart';
import 'package:movies_app/features/see_all_movies/data/repository/see_all_feature_data_repo.dart';
import 'package:movies_app/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';
import 'package:movies_app/features/see_all_movies/domain/usecase/get_see_all_movies_use_case.dart';
import 'package:movies_app/features/see_all_movies/presentation/controllers/cubit/see_all_movies_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupMoviesInjection() {
  getIt.registerLazySingleton<Dio>(() => getDioInfo());

  getIt.registerSingleton(HomeRemoteDataSource(getIt<Dio>()));
  getIt.registerSingleton(SeeAllRemoteDataSource(getIt<Dio>()));
  getIt.registerSingleton(MovieDetailsRemoteDataSource(getIt<Dio>()));
  getIt.registerSingleton(MovieVideosRemoteDataSource(getIt<Dio>()));

  getIt.registerSingleton<HomeFeatureDataRepo>(
    HomeFeatureDataRepo(getIt<HomeRemoteDataSource>()),
  );

  getIt.registerSingleton<SeeAllFeatureDataRepo>(
    SeeAllFeatureDataRepo(getIt<SeeAllRemoteDataSource>()),
  );

  getIt.registerSingleton<MovieDetailsFeatureDataRepo>(
    MovieDetailsFeatureDataRepo(getIt<MovieDetailsRemoteDataSource>()),
  );
  getIt.registerSingleton<MovieVideosFeatureDataRepo>(
    MovieVideosFeatureDataRepo(getIt<MovieVideosRemoteDataSource>()),
  );

  getIt.registerSingleton<HomeFeatureDomainRepo>(getIt<HomeFeatureDataRepo>());

  getIt.registerSingleton<SeeAllFeatureDomainRepo>(
    getIt<SeeAllFeatureDataRepo>(),
  );

  getIt.registerSingleton<MovieDetailsFeatureDomainRepo>(
    getIt<MovieDetailsFeatureDataRepo>(),
  );

  getIt.registerSingleton<MovieVideosFeatureDomainRepo>(
    getIt<MovieVideosFeatureDataRepo>(),
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
    GetMovieDetailsUseCase(getIt<MovieDetailsFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetSimilarMoviesUseCase>(
    GetSimilarMoviesUseCase(getIt<MovieDetailsFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetMovieVideosUseCase>(
    GetMovieVideosUseCase(getIt<MovieDetailsFeatureDomainRepo>()),
  );

  getIt.registerSingleton<GetAllMovieVideosUseCase>(
    GetAllMovieVideosUseCase(getIt<MovieVideosFeatureDomainRepo>()),
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

  getIt.registerFactory<AllMovieVideosCubit>(
    () => AllMovieVideosCubit(getIt<GetAllMovieVideosUseCase>()),
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
