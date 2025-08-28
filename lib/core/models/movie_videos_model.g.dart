// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVideosModel _$MovieVideosModelFromJson(Map<String, dynamic> json) =>
    MovieVideosModel(
      id: (json['id'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => ResultVideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVideosModelToJson(MovieVideosModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results,
    };
