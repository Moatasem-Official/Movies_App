import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class DiscoverMoviesRemoteDataSource {
  factory DiscoverMoviesRemoteDataSource(Dio dio, {String baseUrl}) =
      _DiscoverMoviesRemoteDataSource;

  @GET('discover/movie')
  Future<DiscoverMoviesResponseModel> getDiscoverMovies({
    @Query('api_key') required String apiKey,
    @Query('language') String language = 'en-US',
    @Query('sort_by') String sortBy = 'popularity.desc',
    @Query('include_adult') bool includeAdult = false,
    @Query('include_video') bool includeVideo = false,
    @Query('page') int page = 1,
    @Query('with_watch_monetization_types') String withWatchMonetizationTypes =
        'flatrate',
  });
}