import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_images_entity.dart';
import 'package:movies_app/features/movie_details/domain/repository/movie_details_feature_domain_repo.dart';

class GetMovieImagesUseCase {
  final MovieDetailsFeatureDomainRepo movieDetailsFeatureDomainRepo;

  GetMovieImagesUseCase({required this.movieDetailsFeatureDomainRepo});

  Future<Either<Failure, MovieImagesEntity>> call({required int movieId}) {
    return movieDetailsFeatureDomainRepo.getMovieImages(movieId: movieId);
  }
}
