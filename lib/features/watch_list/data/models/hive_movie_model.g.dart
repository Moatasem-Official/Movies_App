// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMovieModelAdapter extends TypeAdapter<HiveMovieModel> {
  @override
  final int typeId = 0;

  @override
  HiveMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMovieModel(
      backdropPath: fields[0] as String?,
      genreIds: (fields[1] as List).cast<int>(),
      id: fields[2] as int,
      originalLanguage: fields[3] as String,
      originalTitle: fields[4] as String,
      overview: fields[5] as String,
      popularity: fields[6] as double,
      posterPath: fields[7] as String?,
      releaseDate: fields[8] as String,
      title: fields[9] as String,
      voteAverage: fields[10] as double,
      voteCount: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMovieModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.genreIds)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.posterPath)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.voteAverage)
      ..writeByte(11)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HiveMovieModel _$HiveMovieModelFromJson(Map<String, dynamic> json) =>
    HiveMovieModel(
      backdropPath: json['backdropPath'] as String?,
      genreIds: (json['genreIds'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      id: (json['id'] as num).toInt(),
      originalLanguage: json['originalLanguage'] as String,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String?,
      releaseDate: json['releaseDate'] as String,
      title: json['title'] as String,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toInt(),
    );

Map<String, dynamic> _$HiveMovieModelToJson(HiveMovieModel instance) =>
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
