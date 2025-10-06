import '../../../../core/entities/display_different_movies_types_entity.dart';
import '../repository/movies_watch_list_feature_domain_repo.dart';

class AddMovieToWatchListUseCase {
  final MoviesWatchListFeatureDomainRepo moviesWatchListFeatureDomainRepo;

  AddMovieToWatchListUseCase({required this.moviesWatchListFeatureDomainRepo});

  Future<void> call({required ResultEntity movie}) =>
      moviesWatchListFeatureDomainRepo.addMovieToWatchList(movie: movie);
}
