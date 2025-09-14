// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_poster_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviePosterModel _$MoviePosterModelFromJson(Map<String, dynamic> json) =>
    MoviePosterModel(
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      height: (json['height'] as num).toInt(),
      iso_639_1: json['iso_639_1'] as String?,
      filePath: json['file_path'] as String?,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      width: (json['width'] as num).toInt(),
    );

Map<String, dynamic> _$MoviePosterModelToJson(MoviePosterModel instance) =>
    <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'height': instance.height,
      'iso_639_1': instance.iso_639_1,
      'file_path': instance.filePath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };
