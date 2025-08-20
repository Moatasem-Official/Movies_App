import 'package:dio/dio.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/models/display_different_movies_types_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET("movie/now_playing?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getNowPlayingMovies();

  @GET('movie/popular?api_key=${AppConstants.kApiKey}')
  Future<DisplayDifferentMoviesTypesModel> getPopularMovies();

  @GET("movie/top_rated?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getTopRatedMovies();

  @GET("movie/upcoming?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getUpcomingMovies();

  @GET("movie/{movie_id}?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getMovieDetails(
    @Path("movie_id") int movieId,
  );
}
