import 'package:dio/dio.dart';
import 'package:movies_app/core/models/display_different_movies_types_model.dart';
import 'package:movies_app/core/utils/app_constants.dart';
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
  Future<DisplayDifferentMoviesTypesModel> getSeeAllMovies(
    @Path("movie_type") String movieType,
    @Path("page") int page,
  );
}
