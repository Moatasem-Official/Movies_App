import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/entities/movie_videos_entity.dart';
part 'result_video_model.g.dart';

@JsonSerializable()
class ResultVideoModel extends ResultVideoEntity {
  @override
  @JsonKey(name: 'iso_639_1')
  final String iso_639_1;
  @override
  @JsonKey(name: 'iso_3166_1')
  final String iso_3166_1;
  @override
  @JsonKey(name: 'published_at')
  final String publishedAt;
  ResultVideoModel({
    required this.iso_639_1,
    required this.iso_3166_1,
    required super.name,
    required super.key,
    required super.site,
    required super.size,
    required super.type,
    required super.official,
    required this.publishedAt,
    required super.id,
  }) : super(
         iso_639_1: iso_639_1,
         iso_3166_1: iso_3166_1,
         publishedAt: publishedAt,
       );

  factory ResultVideoModel.fromJson(Map<String, dynamic> json) =>
      _$ResultVideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultVideoModelToJson(this);
}
