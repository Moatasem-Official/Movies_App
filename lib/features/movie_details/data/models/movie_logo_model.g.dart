// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_logo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieLogoModel _$MovieLogoModelFromJson(Map<String, dynamic> json) =>
    MovieLogoModel(
      aspectRatio: (json['aspectRatio'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      iso_639_1: json['iso_639_1'] as String,
      filePath: json['filePath'] as String?,
      voteAverage: (json['voteAverage'] as num).toInt(),
      voteCount: (json['voteCount'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$MovieLogoModelToJson(MovieLogoModel instance) =>
    <String, dynamic>{
      'aspectRatio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'filePath': instance.filePath,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'width': instance.width,
    };
