import 'package:dio/dio.dart';
import 'package:movies_app/core/models/display_different_movies_types_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/discover_movies/data/models/movies_categories_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'discover_movies_remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class DiscoverMoviesRemoteDataSource {
  factory DiscoverMoviesRemoteDataSource(Dio dio, {String baseUrl}) =
      _DiscoverMoviesRemoteDataSource;

  @GET('genre/movie/list?api_key=${AppConstants.kApiKey}')
  Future<MoviesCategoriesModel> getDiscoverMovies();

  @GET(
      'discover/movie?api_key=${AppConstants.kApiKey}&with_genres={genre_id}&language=en-US&page={page}')
  Future<DisplayDifferentMoviesTypesModel> getcategoryMovies(
      {@Path('genre_id') required int genreId, @Path('page') int page = 1});
}
