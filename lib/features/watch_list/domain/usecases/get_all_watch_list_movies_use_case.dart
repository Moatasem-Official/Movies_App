import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/models/result_model.dart';
import 'package:movies_app/features/watch_list/domain/repository/movies_watch_list_feature_domain_repo.dart';

class GetAllWatchListMoviesUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;
  GetAllWatchListMoviesUseCase(
      {required this.moviesWatchListFeatureDomainRepo});

  Future<Either<Failure, List<ResultModel>>> call() =>
      moviesWatchListFeatureDomainRepo.getAllWatchListMovies();
}
