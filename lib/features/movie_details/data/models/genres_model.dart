import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/features/movie_details/domain/entities/genres_entity.dart';
part 'genres_model.g.dart';

@JsonSerializable()
class GenresModel extends GenresEntity {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) =>
      _$GenresModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenresModelToJson(this);
}
