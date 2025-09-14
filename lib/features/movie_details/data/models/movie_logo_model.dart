import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_logo_entity.dart';
part 'movie_logo_model.g.dart';

@JsonSerializable()
class MovieLogoModel extends MovieLogoEntity {
  @override
  final double aspectRatio;
  @override
  final int height;
  @override
  final String iso_639_1;
  @override
  final String? filePath;
  @override
  final int voteAverage;
  @override
  final int voteCount;
  @override
  final int width;

  MovieLogoModel({
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

  factory MovieLogoModel.fromJson(Map<String, dynamic> json) =>
      _$MovieLogoModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieLogoModelToJson(this);
}
