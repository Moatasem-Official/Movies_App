import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/display_different_movies_types_entity.dart';
part 'dates_model.g.dart';

@JsonSerializable()
class DatesModel extends DatesEntity {
  const DatesModel({required super.maximum, required super.minimum});

  factory DatesModel.fromJson(Map<String, dynamic> json) =>
      _$DatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$DatesModelToJson(this);
}
