import 'package:freezed_annotation/freezed_annotation.dart';
import '../entities/display_different_movies_types_entity.dart';
import 'dates_model.dart';
import 'result_model.dart';

part 'display_different_movies_types_model.g.dart';

@JsonSerializable()
class DisplayDifferentMoviesTypesModel
    extends DisplayDifferentMoviesTypesEntity {
  @override
  final DatesModel? dates;
  @override
  final List<ResultModel> results;

  const DisplayDifferentMoviesTypesModel({
    required super.page,
    required this.dates,
    required this.results,
  }) : super(dates: dates, results: results);

  factory DisplayDifferentMoviesTypesModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$DisplayDifferentMoviesTypesModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DisplayDifferentMoviesTypesModelToJson(this);
}
