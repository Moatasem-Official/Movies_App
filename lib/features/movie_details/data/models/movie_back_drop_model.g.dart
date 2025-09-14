// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_back_drop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieBackDropModel _$MovieBackDropModelFromJson(Map<String, dynamic> json) =>
    MovieBackDropModel(
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      iso_639_1: json['iso_639_1'] as String?,
      filePath: json['file_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$MovieBackDropModelToJson(MovieBackDropModel instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
