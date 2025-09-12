import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app/features/movie_details/data/models/movies_cast_model.dart';
import 'package:movies_app/features/movie_details/data/models/movies_crew_model.dart';

part 'movies_credits_model.g.dart';

@JsonSerializable()
class MovieCreditsModel {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  const MovieCreditsModel({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory MovieCreditsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieCreditsModelToJson(this);
}
