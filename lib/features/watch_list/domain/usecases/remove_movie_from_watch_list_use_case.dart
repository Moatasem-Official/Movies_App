import '../repository/movies_watch_list_feature_domain_repo.dart';

class RemoveMovieFromWatchListUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;
  RemoveMovieFromWatchListUseCase(
      {required this.moviesWatchListFeatureDomainRepo});

  Future<void> call({required int movieId}) => moviesWatchListFeatureDomainRepo
      .removeMovieFromWatchList(movieId: movieId);
}
