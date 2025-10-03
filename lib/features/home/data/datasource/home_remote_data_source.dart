import 'package:dio/dio.dart';
import 'package:movies_app/core/models/display_different_movies_types_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio, {String baseUrl}) =
      _HomeRemoteDataSource;

  @GET("movie/now_playing?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getNowPlayingMovies({
    @Query("page") int page = 1,
  });

  @GET('movie/popular?api_key=${AppConstants.kApiKey}')
  Future<DisplayDifferentMoviesTypesModel> getPopularMovies({
    @Query("page") int page = 1,
  });

  @GET("movie/top_rated?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getTopRatedMovies({
    @Query("page") int page = 1,
  });

  @GET("movie/upcoming?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getUpcomingMovies({
    @Query("page") int page = 1,
  });
}
