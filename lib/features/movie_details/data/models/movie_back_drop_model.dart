import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_back_drop_entity.dart';
part 'movie_back_drop_model.g.dart';

@JsonSerializable()
class MovieBackDropModel extends MovieBackDropEntity {
  @override
  final double aspectRatio;
  @override
  final int height;
  @override
  final dynamic iso_639_1;
  @override
  final String? filePath;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final int width;

  MovieBackDropModel({
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

  factory MovieBackDropModel.fromJson(Map<String, dynamic> json) =>
      _$MovieBackDropModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieBackDropModelToJson(this);
}
