import 'package:dartz/dartz.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/watch_list/domain/repository/movies_watch_list_feature_domain_repo.dart';

class GetAllWatchListMoviesUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;
  GetAllWatchListMoviesUseCase(
      {required this.moviesWatchListFeatureDomainRepo});

  Future<Either<Failure, List<ResultEntity>>> call() =>
      moviesWatchListFeatureDomainRepo.getAllWatchListMovies();
}
