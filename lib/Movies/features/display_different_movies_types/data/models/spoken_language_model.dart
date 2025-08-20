import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_details_entity.dart';
part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguageModel extends SpokenLanguageEntity {
  const SpokenLanguageModel({
    required super.englishName,
    required super.iso_639_1,
    required super.name,
  });

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}
