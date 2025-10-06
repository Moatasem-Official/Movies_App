import '../repository/movies_watch_list_feature_domain_repo.dart';

class ClearWatchListUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;
  ClearWatchListUseCase({required this.moviesWatchListFeatureDomainRepo});
  Future<void> call() => moviesWatchListFeatureDomainRepo.clearWatchList();
}
