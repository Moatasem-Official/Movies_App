// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credits_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieCreditsModel _$MovieCreditsModelFromJson(Map<String, dynamic> json) =>
    MovieCreditsModel(
      id: (json['id'] as num).toInt(),
      cast: (json['cast'] as List<dynamic>)
          .map((e) => Cast.fromJson(e as Map<String, dynamic>))
          .toList(),
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieCreditsModelToJson(MovieCreditsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
      'crew': instance.crew,
    };
