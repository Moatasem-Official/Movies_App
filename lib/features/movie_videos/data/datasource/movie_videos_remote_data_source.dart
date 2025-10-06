import 'package:dio/dio.dart';
import '../../../../core/models/movie_videos_model.dart';
import '../../../../core/utils/app_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'movie_videos_remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class MovieVideosRemoteDataSource {
  factory MovieVideosRemoteDataSource(Dio dio, {String baseUrl}) =
      _MovieVideosRemoteDataSource;

  @GET('/movie/{movie_id}/videos?api_key=${AppConstants.kApiKey}')
  Future<MovieVideosModel> getMovieVideos(@Path('movie_id') int movieId);
}
