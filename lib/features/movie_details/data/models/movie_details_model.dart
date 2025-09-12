import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/features/movie_details/data/models/genres_model.dart';
import 'package:movies_app/features/movie_details/data/models/spoken_language_model.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends MovieDetailsEntity {
  @override
  final List<GenresModel> genres;
  @override
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguageModel> spokenLanguages;
  @override
  @JsonKey(name: 'backdrop_path')
  final dynamic backdropPath;
  @override
  @JsonKey(name: 'belongs_to_collection')
  final dynamic belongsToCollection;
  @override
  @JsonKey(name: 'imdb_id')
  final String imdbId;
  @override
  @JsonKey(name: 'origin_country')
  final List<String> originCountry;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'production_companies')
  final List<dynamic> productionCompanies;
  @override
  @JsonKey(name: 'production_countries')
  final List<dynamic> productionCountries;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'vote_average')
  final int voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  const MovieDetailsModel({
    required super.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required super.budget,
    required this.genres,
    required super.homepage,
    required super.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required super.overview,
    required super.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required super.revenue,
    required super.runtime,
    required this.spokenLanguages,
    required super.status,
    required super.tagline,
    required super.title,
    required super.video,
    required this.voteAverage,
    required this.voteCount,
  }) : super(
          genres: genres,
          spokenLanguages: spokenLanguages,
          backdropPath: backdropPath,
          belongsToCollection: belongsToCollection,
          imdbId: imdbId,
          originCountry: originCountry,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          posterPath: posterPath,
          productionCompanies: productionCompanies,
          productionCountries: productionCountries,
          releaseDate: releaseDate,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
