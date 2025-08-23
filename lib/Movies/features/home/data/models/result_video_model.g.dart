// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultVideoModel _$ResultVideoModelFromJson(Map<String, dynamic> json) =>
    ResultVideoModel(
      iso_639_1: json['iso_639_1'] as String,
      iso_3166_1: json['iso_3166_1'] as String,
      name: json['name'] as String,
      key: json['key'] as String,
      site: json['site'] as String,
      size: (json['size'] as num).toInt(),
      type: json['type'] as String,
      official: json['official'] as bool,
      publishedAt: json['published_at'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ResultVideoModelToJson(ResultVideoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'size': instance.size,
      'type': instance.type,
      'official': instance.official,
      'id': instance.id,
      'iso_639_1': instance.iso_639_1,
      'iso_3166_1': instance.iso_3166_1,
      'published_at': instance.publishedAt,
    };
