import 'package:dartz/dartz.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../core/errors/failure.dart';
import '../repository/movies_watch_list_feature_domain_repo.dart';

class GetAllWatchListMoviesUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;
  GetAllWatchListMoviesUseCase(
      {required this.moviesWatchListFeatureDomainRepo});

  Future<Either<Failure, List<ResultEntity>>> call() =>
      moviesWatchListFeatureDomainRepo.getAllWatchListMovies();
}
