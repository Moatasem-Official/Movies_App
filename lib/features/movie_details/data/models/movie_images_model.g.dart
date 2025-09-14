// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_images_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieImagesModel _$MovieImagesModelFromJson(Map<String, dynamic> json) =>
    MovieImagesModel(
      id: (json['id'] as num).toInt(),
      backdrops: (json['backdrops'] as List<dynamic>)
          .map((e) => MovieBackDropModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      logos: (json['logos'] as List<dynamic>)
          .map((e) => MovieLogoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      posters: (json['posters'] as List<dynamic>)
          .map((e) => MoviePosterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieImagesModelToJson(MovieImagesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrops': instance.backdrops,
      'logos': instance.logos,
      'posters': instance.posters,
    };
