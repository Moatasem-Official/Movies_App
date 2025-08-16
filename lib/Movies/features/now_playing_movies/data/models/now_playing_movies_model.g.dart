// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingMoviesModel _$NowPlayingMoviesModelFromJson(
  Map<String, dynamic> json,
) => NowPlayingMoviesModel(
  dates: DatesModel.fromJson(json['dates'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>)
      .map((e) => ResultModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$NowPlayingMoviesModelToJson(
  NowPlayingMoviesModel instance,
) => <String, dynamic>{'dates': instance.dates, 'results': instance.results};
