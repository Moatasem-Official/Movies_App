import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/category_genre_entity.dart';
part 'category_genre_model.g.dart';

@JsonSerializable()
class CategoryGenreModel extends CategoryGenreEntity {
  @override
  final int id;
  @override
  final String name;

  CategoryGenreModel({
    required this.id,
    required this.name,
  }) : super(id: id, name: name);

  factory CategoryGenreModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryGenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryGenreModelToJson(this);
}
