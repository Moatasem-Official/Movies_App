import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/now_playing_movies/domain/entities/now_playing_movies_entity.dart';
part 'dates_model.g.dart';

@JsonSerializable()
class DatesModel extends DatesEntity {
  DatesModel({required super.maximum, required super.minimum});

  factory DatesModel.fromJson(Map<String, dynamic> json) =>
      _$DatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DatesModelToJson(this);
}
