import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/home/domain/entities/movie_details_entity.dart';
part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguageModel extends SpokenLanguageEntity {
  @override
  @JsonKey(name: 'english_name')
  final String englishName;

  @override
  @JsonKey(name: 'iso_639_1')
  final String iso_639_1;
  const SpokenLanguageModel({
    required this.englishName,
    required this.iso_639_1,
    required super.name,
  }) : super(englishName: englishName, iso_639_1: iso_639_1);

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}
