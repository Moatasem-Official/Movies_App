// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_movies_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedMoviesModelAdapter extends TypeAdapter<CachedMoviesModel> {
  @override
  final int typeId = 1;

  @override
  CachedMoviesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedMoviesModel(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String?,
      backdropPath: fields[3] as String?,
      releaseDate: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedMoviesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.backdropPath)
      ..writeByte(4)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedMoviesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
