import 'package:dartz/dartz.dart';
import '../../../../../core/entities/display_different_movies_types_entity.dart';
import '../../../../../core/errors/failure.dart';
import '../../repository/home_feature_domain_repo.dart';

class GetNowPlayingCachedMoviesUseCase {
  final HomeFeatureDomainRepo homeFeatureDomainRepo;
  GetNowPlayingCachedMoviesUseCase(this.homeFeatureDomainRepo);
  Future<Either<Failure, DisplayDifferentMoviesTypesEntity>> call() =>
      homeFeatureDomainRepo.getCachedNowPlayingMovies();
}
