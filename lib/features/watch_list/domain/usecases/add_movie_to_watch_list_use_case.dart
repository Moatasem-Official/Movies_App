import 'package:movies_app/core/models/result_model.dart';
import 'package:movies_app/features/watch_list/domain/repository/movies_watch_list_feature_domain_repo.dart';

class AddMovieToWatchListUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;

  AddMovieToWatchListUseCase({required this.moviesWatchListFeatureDomainRepo});

  Future<void> call({required ResultModel movie}) =>
      moviesWatchListFeatureDomainRepo.addMovieToWatchList(movie: movie);
}
