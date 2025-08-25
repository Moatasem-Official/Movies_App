import 'package:dio/dio.dart';
import 'package:movies_app/core/models/display_different_movies_types_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_details_model.dart';
import 'package:movies_app/core/models/movie_videos_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class HomeRemoteDataSource {
  factory HomeRemoteDataSource(Dio dio, {String baseUrl}) =
      _HomeRemoteDataSource;

  @GET("movie/now_playing?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getNowPlayingMovies();

  @GET('movie/popular?api_key=${AppConstants.kApiKey}')
  Future<DisplayDifferentMoviesTypesModel> getPopularMovies();

  @GET("movie/top_rated?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getTopRatedMovies();

  @GET("movie/upcoming?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getUpcomingMovies();
}
