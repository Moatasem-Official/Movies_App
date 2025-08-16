import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/Movies/features/now_playing_movies/domain/entities/now_playing_movies_entity.dart';
import 'dates_model.dart';
import 'result_model.dart';

part 'now_playing_movies_model.g.dart';

@JsonSerializable()
class NowPlayingMoviesModel extends NowplayingMoviesEntity {
  @override
  final DatesModel dates;
  @override
  final List<ResultModel> results;

  NowPlayingMoviesModel({required this.dates, required this.results})
    : super(dates: dates, results: results);

  factory NowPlayingMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingMoviesModelToJson(this);
}
