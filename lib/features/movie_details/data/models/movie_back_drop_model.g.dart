// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_back_drop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieBackDropModel _$MovieBackDropModelFromJson(Map<String, dynamic> json) =>
    MovieBackDropModel(
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      iso_639_1: json['iso_639_1'],
      filePath: json['filePath'] as String?,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$MovieBackDropModelToJson(MovieBackDropModel instance) =>
    <String, dynamic>{
      'aspectRatio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'filePath': instance.filePath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'width': instance.width,
    };
