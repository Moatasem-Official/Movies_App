// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_different_movies_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisplayDifferentMoviesTypesModel _$DisplayDifferentMoviesTypesModelFromJson(
        Map<String, dynamic> json) =>
    DisplayDifferentMoviesTypesModel(
      page: (json['page'] as num).toInt(),
      dates: json['dates'] == null
          ? null
          : DatesModel.fromJson(json['dates'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DisplayDifferentMoviesTypesModelToJson(
        DisplayDifferentMoviesTypesModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'dates': instance.dates,
      'results': instance.results,
    };
