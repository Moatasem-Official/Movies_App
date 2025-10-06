import 'package:dartz/dartz.dart';
import '../../repository/movie_details_feature_domain_repo.dart';
import '../../../../../core/entities/movie_videos_entity.dart';
import '../../../../../core/errors/failure.dart';

class GetMovieVideosUseCase {
  GetMovieVideosUseCase(this.movieDetailsFeatureDomainRepo);
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;

  Future<Either<Failure, MovieVideosEntity>> call({required int movieId}) =>
      movieDetailsFeatureDomainRepo.getMovieVideos(movieId: movieId);
}
