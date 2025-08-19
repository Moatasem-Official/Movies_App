import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/display_different_movies_types_entity.dart';
part 'result_model.g.dart';

@JsonSerializable()
class ResultModel extends ResultEntity {
  @override
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @override
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @override
  final int id;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  final String title;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  const ResultModel({
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

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);
}
