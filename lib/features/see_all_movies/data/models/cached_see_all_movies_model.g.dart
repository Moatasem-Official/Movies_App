// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_see_all_movies_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedSeeAllMoviesModelAdapter
    extends TypeAdapter<CachedSeeAllMoviesModel> {
  @override
  final int typeId = 2;

  @override
  CachedSeeAllMoviesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedSeeAllMoviesModel(
      fields[0] as String,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as int,
      fields[4] as String,
      fields[5] as double,
      fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedSeeAllMoviesModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.releaseDate)
      ..writeByte(5)
      ..write(obj.voteAverage)
      ..writeByte(6)
      ..write(obj.overview);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedSeeAllMoviesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
