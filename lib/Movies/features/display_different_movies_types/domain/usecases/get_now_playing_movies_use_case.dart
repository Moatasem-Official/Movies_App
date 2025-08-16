import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/repository/different_movies_types_domain_repo.dart';

class GetNowPlayingMoviesUseCase {
  final DifferentMoviesTypesDomainRepo nowPlayingMoviesDomainRepo;
  GetNowPlayingMoviesUseCase(this.nowPlayingMoviesDomainRepo);

  Future<DisplayDifferentMoviesTypesEntity> call() =>
      nowPlayingMoviesDomainRepo.getNowPlayingMovies();
}
