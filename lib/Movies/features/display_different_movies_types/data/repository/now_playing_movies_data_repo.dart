import 'package:dartz/dartz.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/datasource/remote_data_source.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';

class NowPlayingMoviesDataRepo implements DifferentMoviesTypesDomainRepo {
  final RemoteDataSource remoteDataSource;
  NowPlayingMoviesDataRepo(this.remoteDataSource);

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getNowPlayingMovies() async {
    try {
      return Right(await remoteDataSource.getNowPlayingMovies());
    } on NetworkExceptions catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getPopularMovies() async {
    try {
      return Right(await remoteDataSource.getPopularMovies());
    } on NetworkExceptions catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>>
  getTopRatedMovies() async {
    try {
      return Right(await remoteDataSource.getTopRatedMovies());
    } on NetworkExceptions catch (e) {
      return Left(ServerFailure(e.errorModel.statusMessage));
    }
  }
}
