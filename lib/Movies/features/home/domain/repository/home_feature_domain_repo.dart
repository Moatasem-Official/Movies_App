import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
import 'package:movies_app/core/errors/failure.dart';

abstract class HomeFeatureDomainRepo {
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getNowPlayingMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getPopularMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getTopRatedMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getUpcomingMovies();
}
