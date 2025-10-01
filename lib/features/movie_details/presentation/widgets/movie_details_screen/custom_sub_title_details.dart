import 'package:flutter/material.dart';
import 'package:movies_app/core/entities/display_different_movies_types_entity.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_actions_and_status.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_chip_list.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_primary_info.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_production_companies.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_stats_table.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomSubTitleDetails extends StatelessWidget {
  const CustomSubTitleDetails({super.key, required this.movieDetailsEntity});

  final MovieDetailsEntity movieDetailsEntity;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الجزء الأول: المعلومات الأساسية (سنة، تقييم، مدة)
            CustomPrimaryInfo(movieDetailsEntity: movieDetailsEntity),
            const SizedBox(height: 20),

            // الجزء الثاني: زر الإضافة للمفضلة والحالة
            CustomActionsAndStatus(movieDetailsEntity: movieDetailsEntity),
            const SizedBox(height: 20),

            // فاصل بصري
            Divider(color: Colors.white.withOpacity(0.2), thickness: 1),
            const SizedBox(height: 20),

            // الجزء الثالث: جدول الإحصائيات (ميزانية، إيرادات، إلخ)
            CustomStatsTable(movieDetailsEntity: movieDetailsEntity),
            const SizedBox(height: 20),

            CustomProductionCompanies(
              movieDetailsEntity: movieDetailsEntity,
            ),
            const SizedBox(height: 20),

            // الجزء الرابع: قائمة بالـ Chips (الدول واللغات)
            CustomChipList(
              title: S.of(context).productionCountries,
              items: movieDetailsEntity.productionCountries
                  .map((e) => e['name'].toString())
                  .toList(),
            ),
            const SizedBox(height: 16),
            CustomChipList(
              title: S.of(context).spokenLanguages,
              items: movieDetailsEntity.spokenLanguages
                  .map((e) => e.name.toString())
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

extension MovieDetailsMapper on MovieDetailsEntity {
  ResultEntity toResultEntity() {
    return ResultEntity(
      id: id,
      title: title,
      posterPath: posterPath,
      overview: overview,
      releaseDate: releaseDate,
      voteAverage: double.parse(voteAverage.toString()),
      backdropPath: backdropPath,
      genreIds: genres.map((e) => e.id).toList(),
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      popularity: double.parse(popularity.toString()),
      voteCount: int.parse(voteCount.toString()),
    );
  }
}
