import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie_crew_entity.dart';

part 'movie_crew_model.g.dart';

@JsonSerializable()
class Crew extends MovieCrewEntity {
  @override
  final bool adult;
  @override
  final int gender;
  @override
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
  final String? profilePath;
  @override
  @JsonKey(name: 'credit_id')
  final String creditId;
  @override
  final String department;
  @override
  final String job;

  const Crew({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.creditId,
    required this.department,
    required this.job,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          creditId: creditId,
          department: department,
          job: job,
        );

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
