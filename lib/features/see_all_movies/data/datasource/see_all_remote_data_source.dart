import 'package:dio/dio.dart';
import '../../../../core/models/display_different_movies_types_model.dart';
import '../../../../core/utils/app_constants.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'see_all_remote_data_source.g.dart';

@RestApi(baseUrl: AppConstants.kApiBaseUrl)
abstract class SeeAllRemoteDataSource {
  factory SeeAllRemoteDataSource(Dio dio, {String baseUrl}) =
      _SeeAllRemoteDataSource;

  @GET(
    '/movie/{movie_type}?api_key=${AppConstants.kApiKey}&language=en-US&page={page}',
  )
  Future<DisplayDifferentMoviesTypesModel> getSeeAllMovies({
    @Path("movie_type") required String movieType,
    @Path("page") int page = 1,
  });

  @GET(
      "movie/{movie_id}/similar?api_key=${AppConstants.kApiKey}&language=en-US&page={page}")
  Future<DisplayDifferentMoviesTypesModel> getSimilarMovies({
    @Path("movie_id") required int movieId,
    @Query("page") int page = 1,
  });
}
