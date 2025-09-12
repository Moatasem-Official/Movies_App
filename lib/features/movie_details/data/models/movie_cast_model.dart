import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_cast_entity.dart';

part 'movie_cast_model.g.dart';

@JsonSerializable()
class Cast extends MovieCastEntity {
  @override
  final bool adult;
  @override
  final int gender;
  final int id;
  @override
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  @override
  final String name;
  @override
  @JsonKey(name: 'original_name')
  final String originalName;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'profile_path')
  final String profilePath;
  @JsonKey(name: 'cast_id')
  final int castId;
  @override
  final String character;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final int order;

  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  }) : super(
          adult: adult,
          gender: gender,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          character: character,
        );

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  Map<String, dynamic> toJson() => _$CastToJson(this);
}
