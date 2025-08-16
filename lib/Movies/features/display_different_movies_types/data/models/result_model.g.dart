// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultModel _$ResultModelFromJson(Map<String, dynamic> json) => ResultModel(
  backdropPath: json['backdropPath'] as String,
  genreIds: (json['genreIds'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  id: (json['id'] as num).toInt(),
  originalLanguage: json['originalLanguage'] as String,
  originalTitle: json['originalTitle'] as String,
  overview: json['overview'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  posterPath: json['posterPath'] as String,
  releaseDate: json['releaseDate'] as String,
  title: json['title'] as String,
  voteAverage: (json['voteAverage'] as num).toDouble(),
  voteCount: (json['voteCount'] as num).toInt(),
);

Map<String, dynamic> _$ResultModelToJson(ResultModel instance) =>
    <String, dynamic>{
      'backdropPath': instance.backdropPath,
      'genreIds': instance.genreIds,
      'id': instance.id,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'releaseDate': instance.releaseDate,
      'title': instance.title,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
