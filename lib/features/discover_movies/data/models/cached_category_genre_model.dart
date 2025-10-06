import 'package:hive/hive.dart';
import '../../domain/entities/category_genre_entity.dart';

part 'cached_category_genre_model.g.dart';

@HiveType(typeId: 3)
class CachedCategoryGenreModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  CachedCategoryGenreModel({
    required this.id,
    required this.name,
  });

  factory CachedCategoryGenreModel.fromEntity({
    required int id,
    required String name,
  }) =>
      CachedCategoryGenreModel(id: id, name: name);

  CategoryGenreEntity toEntity() => CategoryGenreEntity(id: id, name: name);
}
