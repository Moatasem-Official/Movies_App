import 'package:dio/dio.dart';
import 'package:movies_app/Movies/features/now_playing_movies/data/models/now_playing_movies_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class RemoteDataSource {
  factory RemoteDataSource(Dio dio, {String baseUrl}) = _RemoteDataSource;

  @GET("movie/now_playing")
  Future<NowPlayingMoviesModel> getNowPlayingMovies();
}
