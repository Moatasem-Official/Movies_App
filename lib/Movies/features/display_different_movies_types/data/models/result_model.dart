import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
part 'result_model.g.dart';

@JsonSerializable()
class ResultModel extends ResultEntity {
  const ResultModel({
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.voteAverage,
    required super.voteCount,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
