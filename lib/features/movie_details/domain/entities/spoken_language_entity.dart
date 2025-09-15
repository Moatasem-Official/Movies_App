import 'package:equatable/equatable.dart';

class SpokenLanguageEntity extends Equatable {
  final String englishName;
  final String? iso_639_1;
  final String name;

  const SpokenLanguageEntity({
    required this.englishName,
    required this.iso_639_1,
    required this.name,
  });

  @override
  List<Object?> get props => [englishName, iso_639_1, name];
}
