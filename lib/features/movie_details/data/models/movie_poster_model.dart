import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_poster_entity.dart';
part 'movie_poster_model.g.dart';

@JsonSerializable()
class MoviePosterModel extends MoviePosterEntity {
  @override
  final double aspectRatio;
  @override
  final int height;
  @override
  final String iso_639_1;
  @override
  final String? filePath;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final int width;

  MoviePosterModel({
    required this.aspectRatio,
    required this.height,
    required this.iso_639_1,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  }) : super(
          aspectRatio: aspectRatio,
          height: height,
          iso_639_1: iso_639_1,
          filePath: filePath,
          voteAverage: voteAverage,
          voteCount: voteCount,
          width: width,
        );

  factory MoviePosterModel.fromJson(Map<String, dynamic> json) =>
      _$MoviePosterModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviePosterModelToJson(this);
}
