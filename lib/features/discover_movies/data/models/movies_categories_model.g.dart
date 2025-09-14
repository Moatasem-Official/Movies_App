// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesCategoriesModel _$MoviesCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    MoviesCategoriesModel(
      genres: (json['genres'] as List<dynamic>)
          .map((e) => CategoryGenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesCategoriesModelToJson(
        MoviesCategoriesModel instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
