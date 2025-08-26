import 'package:dio/dio.dart';
import 'package:movies_app/core/models/display_different_movies_types_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'movies_search_remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class MoviesSearchRemoteDataSource {
  factory MoviesSearchRemoteDataSource(Dio dio, {String baseUrl}) =
      _MoviesSearchRemoteDataSource;

  @GET('search/movie')
  Future<DisplayDifferentMoviesTypesModel> searchMovies(
    @Query('query') String query,
    @Query('page') int page,
    @Query('api_key') String apiKey,
  );
}
