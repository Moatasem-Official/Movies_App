import 'package:dio/dio.dart';
import 'package:movies_app/features/movie_details/data/models/movie_details_model.dart';
import 'package:movies_app/core/models/movie_videos_model.dart';
import 'package:movies_app/core/models/display_different_movies_types_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/data/models/movie_credits_model.dart';
import 'package:movies_app/features/movie_details/data/models/movie_images_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'movie_details_remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class MovieDetailsRemoteDataSource {
  factory MovieDetailsRemoteDataSource(Dio dio, {String baseUrl}) =
      _MovieDetailsRemoteDataSource;

  @GET("movie/{movie_id}?api_key=${AppConstants.kApiKey}")
  Future<MovieDetailsModel> getMovieDetails(@Path("movie_id") int movieId);

  @GET("movie/{movie_id}/similar?api_key=${AppConstants.kApiKey}")
  Future<DisplayDifferentMoviesTypesModel> getSimilarMovies(
    @Path("movie_id") int movieId,
  );

  @GET("movie/{movie_id}/videos?api_key=${AppConstants.kApiKey}")
  Future<MovieVideosModel> getMovieVideos(@Path("movie_id") int movieId);

  @GET("movie/{movie_id}/credits?api_key=${AppConstants.kApiKey}")
  Future<MovieCreditsModel> getMovieCredits(@Path("movie_id") int movieId);

  @GET("movie/{movie_id}/images?api_key=${AppConstants.kApiKey}")
  Future<MovieImagesModel> getMovieImages(@Path("movie_id") int movieId);
}
