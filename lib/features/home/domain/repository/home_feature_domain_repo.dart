import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';

abstract class HomeFeatureDomainRepo {
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getNowPlayingMovies({
    int page = 1,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getPopularMovies({
    int page = 1,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getTopRatedMovies({
    int page = 1,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> getUpcomingMovies({
    int page = 1,
  });
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedNowPlayingMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedPopularMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedTopRatedMovies();
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
      getCachedUpcomingMovies();
}
