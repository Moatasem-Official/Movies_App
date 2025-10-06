import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie_back_drop_entity.dart';
part 'movie_back_drop_model.g.dart';

@JsonSerializable()
class MovieBackDropModel extends MovieBackDropEntity {
  @override
  @JsonKey(name: 'aspect_ratio')
  final double aspectRatio;
  @override
  final int height;
  @override
  @JsonKey(name: 'iso_639_1')
  final String? iso_639_1;
  @override
  @JsonKey(name: 'file_path')
  final String? filePath;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
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
