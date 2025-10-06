import 'package:json_annotation/json_annotation.dart';
import 'movie_cast_model.dart';
import 'movie_crew_model.dart';
import '../../domain/entities/movie_credits_entity.dart';

part 'movie_credits_model.g.dart';

@JsonSerializable()
class MovieCreditsModel extends MovieCreditsEntity {
  final int id;
  @override
  final List<Cast> cast;
  @override
  final List<Crew> crew;

  const MovieCreditsModel({
    required this.id,
    required this.cast,
    required this.crew,
  }) : super(
          cast: cast,
          crew: crew,
        );

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsModelToJson(this);
}
