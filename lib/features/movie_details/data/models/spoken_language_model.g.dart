// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguageModel _$SpokenLanguageModelFromJson(Map<String, dynamic> json) =>
    SpokenLanguageModel(
      englishName: json['english_name'] as String,
      iso_639_1: json['iso_639_1'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$SpokenLanguageModelToJson(
        SpokenLanguageModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'english_name': instance.englishName,
      'iso_639_1': instance.iso_639_1,
    };
