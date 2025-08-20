// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailsModel _$MovieDetailsModelFromJson(Map<String, dynamic> json) =>
    MovieDetailsModel(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'],
      belongsToCollection: json['belongsToCollection'],
      budget: (json['budget'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String,
      id: (json['id'] as num).toInt(),
      imdbId: json['imdbId'] as String,
      originCountry: (json['originCountry'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      originalLanguage: json['originalLanguage'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String,
      productionCompanies: json['productionCompanies'] as List<dynamic>,
      productionCountries: json['productionCountries'] as List<dynamic>,
      releaseDate: json['releaseDate'] as String,
      revenue: (json['revenue'] as num).toInt(),
      runtime: (json['runtime'] as num).toInt(),
      spokenLanguages: (json['spokenLanguages'] as List<dynamic>)
          .map((e) => SpokenLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['voteAverage'] as num).toInt(),
      voteCount: (json['voteCount'] as num).toInt(),
    );

Map<String, dynamic> _$MovieDetailsModelToJson(MovieDetailsModel instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'belongsToCollection': instance.belongsToCollection,
      'budget': instance.budget,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'originCountry': instance.originCountry,
      'originalLanguage': instance.originalLanguage,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'releaseDate': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
      'genres': instance.genres,
      'spokenLanguages': instance.spokenLanguages,
    };
