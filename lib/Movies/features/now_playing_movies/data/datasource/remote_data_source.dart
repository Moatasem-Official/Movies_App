import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET("movie/now_playing")
  Future<NowPlayingMoviesResponse> getNowPlayingMovies();
}
