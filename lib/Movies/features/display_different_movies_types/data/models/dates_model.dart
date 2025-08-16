import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
part 'dates_model.g.dart';

@JsonSerializable()
class DatesModel extends DatesEntity {
  DatesModel({required super.maximum, required super.minimum});

  factory DatesModel.fromJson(Map<String, dynamic> json) =>
      _$DatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DatesModelToJson(this);
}
