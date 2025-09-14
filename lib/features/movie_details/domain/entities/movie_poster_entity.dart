import 'package:movies_app/features/movie_details/domain/entities/base_movie_images_entity.dart';

class MoviePosterEntity extends BaseImageEntity {
  final double aspectRatio;
  final int height;
  final String? iso_639_1;
  @override
  final String? filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  const MoviePosterEntity({
    required this.aspectRatio,
    required this.height,
    required this.iso_639_1,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  }) : super(filePath: filePath);
}
