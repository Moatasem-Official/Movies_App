import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../entities/movie_images_entity.dart';
import '../../repository/movie_details_feature_domain_repo.dart';

class GetMovieImagesUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;

  GetMovieImagesUseCase({required this.movieDetailsFeatureDomainRepo});

  Future<Either<Failure, MovieImagesEntity>> call({required int movieId}) {
    return movieDetailsFeatureDomainRepo.getMovieImages(movieId: movieId);
  }
}
