import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/watch_list/domain/repository/movies_watch_list_feature_domain_repo.dart';

class IsMovieInWatchListUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;

  IsMovieInWatchListUseCase(this.moviesWatchListFeatureDomainRepo);

  Future<Either<Failure, bool>> call({required int movieId}) =>
      moviesWatchListFeatureDomainRepo.isMovieInWatchList(movieId: movieId);
}
