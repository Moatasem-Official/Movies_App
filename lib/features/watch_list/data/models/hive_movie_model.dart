import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/entities/display_different_movies_types_entity.dart';
import 'package:hive/hive.dart';
part 'hive_movie_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class HiveMovieModel extends ResultEntity {
  @override
  @HiveField(0)
  final String? backdropPath;
  @override
  @HiveField(1)
  final List<int> genreIds;
  @override
  @HiveField(2)
  final int id;
  @override
  @HiveField(3)
  final String originalLanguage;
  @override
  @HiveField(4)
  final String originalTitle;
  @override
  @HiveField(5)
  final String overview;
  @override
  @HiveField(6)
  final double popularity;
  @override
  @HiveField(7)
  final String? posterPath;
  @override
  @HiveField(8)
  final String releaseDate;
  @override
  @HiveField(9)
  final String title;
  @override
  @HiveField(10)
  final double voteAverage;
  @override
  @HiveField(11)
  final int voteCount;

  const HiveMovieModel({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory HiveMovieModel.fromJson(Map<String, dynamic> json) =>
      _$HiveMovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$HiveMovieModelToJson(this);

  factory HiveMovieModel.fromEntity(ResultEntity entity) {
    return HiveMovieModel(
      backdropPath: entity.backdropPath,
      genreIds: entity.genreIds,
      id: entity.id,
      originalLanguage: entity.originalLanguage,
      originalTitle: entity.originalTitle,
      overview: entity.overview,
      popularity: entity.popularity,
      posterPath: entity.posterPath,
      releaseDate: entity.releaseDate,
      title: entity.title,
      voteAverage: entity.voteAverage,
      voteCount: entity.voteCount,
    );
  }

  ResultEntity toEntity() {
    return ResultEntity(
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
