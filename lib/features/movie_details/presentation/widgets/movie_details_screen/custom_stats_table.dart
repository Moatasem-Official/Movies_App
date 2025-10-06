import 'package:flutter/material.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../domain/entities/movie_details_entity.dart';
import '../../helpers/custom_table_row.dart';
import '../../../../../generated/l10n.dart';

class CustomStatsTable extends StatelessWidget {
  final MovieDetailsEntity movieDetailsEntity;

  const CustomStatsTable({super.key, required this.movieDetailsEntity});

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(
      color: Colors.white70,
      fontSize: 15,
      height: 1.8,
    );
    const valueStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      height: 1.8,
    );

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(2),
      },
      children: [
        buildTableRow(
          S.of(context).budget,
          AppHelpers.formatCurrency(movieDetailsEntity.budget),
          labelStyle,
          valueStyle,
        ),
        buildTableRow(
          S.of(context).revenue,
          AppHelpers.formatCurrency(movieDetailsEntity.revenue),
          labelStyle,
          valueStyle,
        ),
        buildTableRow(
          S.of(context).popularity,
          movieDetailsEntity.popularity.toStringAsFixed(0),
          labelStyle,
          valueStyle,
        ),
        buildTableRow(
          S.of(context).voteCount,
          movieDetailsEntity.voteCount.toString(),
          labelStyle,
          valueStyle,
        ),
        buildTableRow(
          S.of(context).originalLanguage,
          movieDetailsEntity.originalLanguage.toUpperCase(),
          labelStyle,
          valueStyle,
        ),
      ],
    );
  }
}
