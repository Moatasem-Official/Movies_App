import 'package:json_annotation/json_annotation.dart';
import 'movie_back_drop_model.dart';
import 'movie_logo_model.dart';
import 'movie_poster_model.dart';
import '../../domain/entities/movie_images_entity.dart';

part 'movie_images_model.g.dart';

@JsonSerializable()
class MovieImagesModel extends MovieImagesEntity {
  final int id;
  final List<MovieBackDropModel> backdrops;
  final List<MovieLogoModel> logos;
  final List<MoviePosterModel> posters;

  MovieImagesModel(
      {required this.id,
      required this.backdrops,
      required this.logos,
      required this.posters})
      : super(backdrops: backdrops, logos: logos, posters: posters);
      
  factory MovieImagesModel.fromJson(Map<String, dynamic> json) =>
      _$MovieImagesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieImagesModelToJson(this);
}
