import 'package:freezed_annotation/freezed_annotation.dart';
import 'result_video_model.dart';
import '../entities/movie_videos_entity.dart';
part 'movie_videos_model.g.dart';

@JsonSerializable()
class MovieVideosModel extends MovieVideosEntity {
  @override
  final List<ResultVideoModel> results;
  MovieVideosModel({required super.id, required this.results})
    : super(results: results);

  factory MovieVideosModel.fromJson(Map<String, dynamic> json) =>
      _$MovieVideosModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVideosModelToJson(this);
}
