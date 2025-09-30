import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movies_app/core/cubits/lang/cubit/locale_cubit.dart';
import 'package:movies_app/core/cubits/theme/cubit/theme_cubit.dart';
import 'package:movies_app/features/discover_movies/data/datasource/discover_movies_local_data_source.dart';
import 'package:movies_app/features/discover_movies/data/datasource/discover_movies_local_data_source_impl.dart';
import 'package:movies_app/features/discover_movies/data/datasource/discover_movies_remote_data_source.dart';
import 'package:movies_app/features/discover_movies/data/repository/discover_movies_feature_data_repo.dart';
import 'package:movies_app/features/discover_movies/domain/repository/discover_movies_feature_domain_repo.dart';
import 'package:movies_app/features/discover_movies/domain/usecases/get_category_movies_use_case.dart';
import 'package:movies_app/features/discover_movies/domain/usecases/get_discover_movies_use_case.dart';
import 'package:movies_app/features/discover_movies/presentation/controllers/cubit/category_movies_cubit.dart';
import 'package:movies_app/features/discover_movies/presentation/controllers/cubit/discover_movies_cubit.dart';
import 'package:movies_app/features/home/data/datasource/home_local_data_source.dart';
import 'package:movies_app/features/home/data/datasource/home_local_data_source_impl.dart';
import 'package:movies_app/features/home/data/datasource/home_remote_data_source.dart';
import 'package:movies_app/features/home/data/repository/home_feature_data_repo.dart';
import 'package:movies_app/features/home/domain/repository/home_feature_domain_repo.dart';
import 'package:movies_app/features/movie_details/data/datasource/movie_details_remote_data_source.dart';
import 'package:movies_app/features/movie_details/data/repository/movie_details_feature_data_repo.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_credits_use_case.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_details_use_case.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_images_use_case.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_movie_videos_use_case.dart';
import 'package:movies_app/features/movie_details/domain/usecases/Movie_Details_Screen/get_similar_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_now_playing_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_popular_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_top_rated_movies_use_case.dart';
import 'package:movies_app/features/home/domain/usecases/Movies_Home_Screen/get_upcomming_movies_use_case.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_credits_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_images_cubit.dart';
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
import 'package:movies_app/features/movies_search/data/datasource/movies_search_remote_data_source.dart';
import 'package:movies_app/features/movies_search/data/repository/movies_search_feature_data_repo.dart';
import 'package:movies_app/features/movies_search/domain/repository/movies_search_feature_domain_repo.dart';
import 'package:movies_app/features/movies_search/domain/usecases/get_searched_movies_use_case.dart';
import 'package:movies_app/features/movies_search/presentation/controllers/cubit/movies_search_cubit.dart';
import 'package:movies_app/features/see_all_movies/data/datasource/see_all_local_data_source.dart';
import 'package:movies_app/features/see_all_movies/data/datasource/see_all_local_data_source_impl.dart';
import 'package:movies_app/features/see_all_movies/data/datasource/see_all_remote_data_source.dart';
import 'package:movies_app/features/see_all_movies/data/repository/see_all_feature_data_repo.dart';
import 'package:movies_app/features/see_all_movies/domain/repository/see_all_feature_domain_repo.dart';
import 'package:movies_app/features/see_all_movies/domain/usecase/get_movie_similar_movies_use_case.dart';
import 'package:movies_app/features/see_all_movies/domain/usecase/get_see_all_movies_use_case.dart';
import 'package:movies_app/features/see_all_movies/presentation/controllers/cubit/see_all_movies_cubit.dart';
import 'package:movies_app/features/watch_list/data/datasource/movies_watch_list_local_data_source.dart';
import 'package:movies_app/features/watch_list/data/datasource/movies_watch_list_local_data_source_impl.dart';
import 'package:movies_app/features/watch_list/data/repository/movies_watch_list_feature_data_repo.dart';
import 'package:movies_app/features/watch_list/domain/repository/movies_watch_list_feature_domain_repo.dart';
import 'package:movies_app/features/watch_list/domain/usecases/add_movie_to_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/clear_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/get_all_watch_list_movies_use_case.dart';
import 'package:movies_app/features/watch_list/domain/usecases/remove_movie_from_watch_list_use_case.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupMoviesInjection() async {
  getIt.registerLazySingleton<Dio>(() => getDioInfo());
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl());
  getIt.registerLazySingleton<SeeAllRemoteDataSource>(
      () => SeeAllRemoteDataSource(getIt<Dio>()));
  getIt.registerLazySingleton<SeeAllLocalDataSource>(
      () => SeeAllLocalDataSourceImpl());
  getIt.registerLazySingleton<MovieDetailsRemoteDataSource>(
      () => MovieDetailsRemoteDataSource(getIt<Dio>()));
  getIt.registerLazySingleton<MovieVideosRemoteDataSource>(
      () => MovieVideosRemoteDataSource(getIt<Dio>()));
  getIt.registerLazySingleton<MoviesSearchRemoteDataSource>(
      () => MoviesSearchRemoteDataSource(getIt<Dio>()));
  getIt.registerLazySingleton<DiscoverMoviesRemoteDataSource>(
      () => DiscoverMoviesRemoteDataSource(getIt<Dio>()));
  getIt.registerLazySingleton<DiscoverMoviesLocalDataSource>(
      () => DiscoverMoviesLocalDataSourceImpl());
  getIt.registerLazySingleton<MoviesWatchListLocalDataSource>(
      () => MoviesWatchListLocalDataSourceImpl());

  getIt.registerLazySingleton<HomeFeatureDomainRepo>(
    () => HomeFeatureDataRepo(
        homeRemoteDataSource: getIt<HomeRemoteDataSource>(),
        homeLocalDataSource: getIt<HomeLocalDataSource>()),
  );

  getIt.registerLazySingleton<SeeAllFeatureDomainRepo>(
    () => SeeAllFeatureDataRepo(
      seeAllLocalDataSource: getIt<SeeAllLocalDataSource>(),
      seeAllRemoteDataSource: getIt<SeeAllRemoteDataSource>(),
    ),
  );

  getIt.registerLazySingleton<MovieDetailsFeatureDomainRepo>(
    () => MovieDetailsFeatureDataRepo(getIt<MovieDetailsRemoteDataSource>()),
  );
  getIt.registerLazySingleton<MovieVideosFeatureDomainRepo>(
    () => MovieVideosFeatureDataRepo(getIt<MovieVideosRemoteDataSource>()),
  );
  getIt.registerLazySingleton<MoviesSearchFeatureDomainRepo>(
    () => MoviesSearchFeatureDataRepo(getIt<MoviesSearchRemoteDataSource>()),
  );
  getIt.registerLazySingleton<MoviesWatchListFeatureDomainRepo>(
    () => MoviesWatchListFeatureDataRepo(
        moviesWatchListLocalDataSource:
            getIt<MoviesWatchListLocalDataSource>()),
  );

  getIt.registerLazySingleton<DiscoverMoviesFeatureDomainRepo>(
    () => DiscoverMoviesFeatureDataRepo(
        discoverMoviesRemoteDataSource: getIt<DiscoverMoviesRemoteDataSource>(),
        discoverMoviesLocalDataSource: getIt<DiscoverMoviesLocalDataSource>()),
  );

  getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(
    () => GetNowPlayingMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );
  getIt.registerLazySingleton<GetTopRatedMoviesUseCase>(
    () => GetTopRatedMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerLazySingleton<GetPopularMoviesUseCase>(
    () => GetPopularMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerLazySingleton<GetUpcommingMoviesUseCase>(
    () => GetUpcommingMoviesUseCase(getIt<HomeFeatureDomainRepo>()),
  );

  getIt.registerLazySingleton<GetSeeAllMoviesUseCase>(
    () => GetSeeAllMoviesUseCase(
      seeAllFeatureDomainRepo: getIt<SeeAllFeatureDomainRepo>(),
    ),
  );

  getIt.registerLazySingleton<GetMovieDetailsUseCase>(
    () => GetMovieDetailsUseCase(getIt<MovieDetailsFeatureDomainRepo>()),
  );

  getIt.registerLazySingleton<GetSimilarMoviesUseCase>(
    () => GetSimilarMoviesUseCase(getIt<MovieDetailsFeatureDomainRepo>()),
  );

  getIt.registerLazySingleton<GetMovieVideosUseCase>(
    () => GetMovieVideosUseCase(getIt<MovieDetailsFeatureDomainRepo>()),
  );

  getIt.registerLazySingleton<GetAllMovieVideosUseCase>(
    () => GetAllMovieVideosUseCase(getIt<MovieVideosFeatureDomainRepo>()),
  );
  getIt.registerLazySingleton<GetSearchedMoviesUseCase>(
    () => GetSearchedMoviesUseCase(getIt<MoviesSearchFeatureDomainRepo>()),
  );
  getIt.registerLazySingleton<GetAllWatchListMoviesUseCase>(
    () => GetAllWatchListMoviesUseCase(
        moviesWatchListFeatureDomainRepo:
            getIt<MoviesWatchListFeatureDomainRepo>()),
  );
  getIt.registerLazySingleton<AddMovieToWatchListUseCase>(
    () => AddMovieToWatchListUseCase(
        moviesWatchListFeatureDomainRepo:
            getIt<MoviesWatchListFeatureDomainRepo>()),
  );
  getIt.registerLazySingleton<RemoveMovieFromWatchListUseCase>(
    () => RemoveMovieFromWatchListUseCase(
        moviesWatchListFeatureDomainRepo:
            getIt<MoviesWatchListFeatureDomainRepo>()),
  );
  getIt.registerLazySingleton<ClearWatchListUseCase>(
    () => ClearWatchListUseCase(
        moviesWatchListFeatureDomainRepo:
            getIt<MoviesWatchListFeatureDomainRepo>()),
  );
  getIt.registerLazySingleton<GetMovieCreditsUseCase>(
    () => GetMovieCreditsUseCase(
      movieDetailsFeatureDomainRepo: getIt<MovieDetailsFeatureDomainRepo>(),
    ),
  );

  getIt.registerLazySingleton<GetMovieImagesUseCase>(
    () => GetMovieImagesUseCase(
      movieDetailsFeatureDomainRepo: getIt<MovieDetailsFeatureDomainRepo>(),
    ),
  );

  getIt.registerLazySingleton<GetDiscoverMoviesUseCase>(
    () => GetDiscoverMoviesUseCase(
      getIt<DiscoverMoviesFeatureDomainRepo>(),
    ),
  );

  getIt.registerLazySingleton<GetCategoryMoviesUseCase>(
    () => GetCategoryMoviesUseCase(
      getIt<DiscoverMoviesFeatureDomainRepo>(),
    ),
  );

  getIt.registerLazySingleton<GetMovieSimilarMoviesUseCase>(
      () => GetMovieSimilarMoviesUseCase(
            seeAllFeatureDomainRepo: getIt<SeeAllFeatureDomainRepo>(),
          ));

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
    () => SeeAllMoviesCubit(
        getIt<GetSeeAllMoviesUseCase>(), getIt<GetMovieSimilarMoviesUseCase>()),
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

  getIt.registerFactory<MoviesSearchCubit>(
    () => MoviesSearchCubit(getIt<GetSearchedMoviesUseCase>()),
  );

  getIt.registerFactory<AddMovieToWatchListAsLocalDataCubit>(
    () => AddMovieToWatchListAsLocalDataCubit(
        getIt<AddMovieToWatchListUseCase>(),
        getIt<ClearWatchListUseCase>(),
        getIt<GetAllWatchListMoviesUseCase>(),
        getIt<RemoveMovieFromWatchListUseCase>()),
  );

  getIt.registerFactory<MovieCreditsCubit>(
    () => MovieCreditsCubit(getIt<GetMovieCreditsUseCase>()),
  );

  getIt.registerFactory<MovieImagesCubit>(
    () => MovieImagesCubit(getIt<GetMovieImagesUseCase>()),
  );

  getIt.registerFactory<DiscoverMoviesCubit>(
    () => DiscoverMoviesCubit(getIt<GetDiscoverMoviesUseCase>()),
  );

  getIt.registerFactory<CategoryMoviesCubit>(
    () => CategoryMoviesCubit(
        getIt<GetCategoryMoviesUseCase>(), getIt<GetSearchedMoviesUseCase>()),
  );

  getIt.registerFactory<LocaleCubit>(
    () => LocaleCubit(
      getIt<SharedPreferences>(),
    ),
  );

  getIt.registerFactory<ThemeCubit>(
    () => ThemeCubit(
      getIt<SharedPreferences>(),
    ),
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
