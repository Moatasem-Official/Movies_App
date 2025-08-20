import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/models/genres_model.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/data/models/spoken_language_model.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/domain/entities/movie_details_entity.dart';
part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends MovieDetailsEntity {
  @override
  final List<GenresModel> genres;
  @override
  final List<SpokenLanguageModel> spokenLanguages;

  const MovieDetailsModel({
    required super.adult,
    required super.backdropPath,
    required super.belongsToCollection,
    required super.budget,
    required this.genres,
    required super.homepage,
    required super.id,
    required super.imdbId,
    required super.originCountry,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.productionCompanies,
    required super.productionCountries,
    required super.releaseDate,
    required super.revenue,
    required super.runtime,
    required this.spokenLanguages,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  }) : super(genres: genres, spokenLanguages: spokenLanguages);

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
