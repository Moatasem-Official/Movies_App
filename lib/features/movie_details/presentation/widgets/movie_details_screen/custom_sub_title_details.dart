import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/core/utils/app_helpers.dart';

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
            _buildPrimaryInfo(),
            const SizedBox(height: 20),

            // الجزء الثاني: زر الإضافة للمفضلة والحالة
            _buildActionsAndStatus(),
            const SizedBox(height: 20),

            // فاصل بصري
            Divider(color: Colors.white.withOpacity(0.2), thickness: 1),
            const SizedBox(height: 20),

            // الجزء الثالث: جدول الإحصائيات (ميزانية، إيرادات، إلخ)
            _buildStatsTable(),
            const SizedBox(height: 20),

            _buildProductionCompanies(),
            const SizedBox(height: 20),

            // الجزء الرابع: قائمة بالـ Chips (الدول واللغات)
            _buildChipList(
              title: "Production Countries",
              items: movieDetailsEntity.productionCountries
                  .map((e) => e['name'].toString())
                  .toList(),
            ),
            const SizedBox(height: 16),
            _buildChipList(
              title: "Spoken Languages",
              items: movieDetailsEntity.spokenLanguages
                  .map((e) => e.name.toString())
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductionCompanies() {
    // فلترة الشركات التي ليس لها اسم أو شعار قد تكون فكرة جيدة
    final companies = movieDetailsEntity.productionCompanies;
    if (companies.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Production Companies",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80, // ارتفاع محدد للقائمة الأفقية
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: companies.length,
            itemBuilder: (context, index) {
              final company = companies[index];
              final logoPath = company['logo_path'];

              return Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9), // خلفية بيضاء للشعارات
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: logoPath != null && logoPath.isNotEmpty
                      // في حالة وجود شعار
                      ? Image.network(
                          '${AppConstants.imagePathUrl}$logoPath',
                          width: 100, // عرض محدد للصورة
                          fit: BoxFit.contain,
                          // لإظهار اسم الشركة كحل بديل في حال فشل تحميل الصورة
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Text(
                                company['name'],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        )
                      // في حالة عدم وجود شعار، نعرض الاسم
                      : SizedBox(
                          width: 100,
                          child: Center(
                            child: Text(
                              company['name'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // Widget _buildCastSection() {
  //   // افترض أن movieDetailsEntity.cast هي قائمة بالممثلين
  //   final List<dynamic> cast = movieDetailsEntity.; // CastEntity
  //   if (cast.isEmpty) return const SizedBox.shrink();

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         "Cast",
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       SizedBox(
  //         height: 180, // ارتفاع مناسب لعرض الصورة والنص
  //         child: ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: cast.length,
  //           itemBuilder: (context, index) {
  //             final actor = cast[index];
  //             final profilePath = actor.profilePath; // actor['profile_path']

  //             return SizedBox(
  //               width: 100, // عرض ثابت لكل عنصر
  //               child: Card(
  //                 color: Colors.transparent,
  //                 elevation: 0,
  //                 child: Column(
  //                   children: [
  //                     // --- الصورة ---
  //                     CircleAvatar(
  //                       radius: 50,
  //                       backgroundColor: Colors.white.withOpacity(0.1),
  //                       child: ClipOval(
  //                         child: profilePath != null && profilePath.isNotEmpty
  //                             // في حالة وجود صورة
  //                             ? Image.network(
  //                                 '${AppConstants.imagePathUrl}$profilePath',
  //                                 fit: BoxFit.cover,
  //                                 width: 100,
  //                                 height: 100,
  //                                 // في حالة فشل التحميل
  //                                 errorBuilder: (context, error, stackTrace) {
  //                                   return const Icon(Icons.person, size: 50, color: Colors.white60);
  //                                 },
  //                               )
  //                             // في حالة عدم وجود صورة
  //                             : const Icon(Icons.person, size: 50, color: Colors.white60),
  //                       ),
  //                     ),
  //                     const SizedBox(height: 8),
  //                     // --- اسم الممثل ---
  //                     Text(
  //                       actor.name, // actor['name']
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                       textAlign: TextAlign.center,
  //                       style: const TextStyle(
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                         fontSize: 13,
  //                       ),
  //                     ),
  //                     const SizedBox(height: 2),
  //                     // --- اسم الشخصية ---
  //                     Text(
  //                       actor.character, // actor['character']
  //                       maxLines: 1,
  //                       overflow: TextOverflow.ellipsis,
  //                       textAlign: TextAlign.center,
  //                       style: const TextStyle(
  //                         color: Colors.white70,
  //                         fontSize: 12,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       ),
  //     ],
  //   );
  // }

  /// ويدجت لعرض المعلومات الأساسية باستخدام Wrap لتجنب الـ Overflow
  Widget _buildPrimaryInfo() {
    return Wrap(
      spacing: 16.0, // المسافة الأفقية بين العناصر
      runSpacing: 8.0, // المسافة الرأسية في حالة النزول لسطر جديد
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // السنة
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white70),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            movieDetailsEntity.releaseDate.split('-')[0],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // التقييم
        _buildIconText(
          icon: Icons.star_rounded,
          text: '${movieDetailsEntity.voteAverage.toStringAsFixed(1)}/10',
          iconColor: Colors.amber,
        ),
        // المدة
        _buildIconText(
          icon: Icons.timer_outlined,
          text: AppHelpers.formatRuntime(movieDetailsEntity.runtime),
        ),
      ],
    );
  }

  /// ويدجت لعرض زر الإضافة والحالة
  Widget _buildActionsAndStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // الحالة
        Text(
          movieDetailsEntity.status,
          style: TextStyle(
            color: Colors.greenAccent.shade400,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        // زر الإضافة للمفضلة
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              // TODO: Implement bookmark functionality
            },
            icon: const Icon(
              Icons.bookmark_border_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      ],
    );
  }

  /// ويدجت لعرض الإحصائيات في جدول منظم
  Widget _buildStatsTable() {
    const labelStyle = TextStyle(
      color: Colors.white70,
      fontSize: 15,
      height: 1.8, // لزيادة المسافة بين الصفوف
    );
    const valueStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
      height: 1.8,
    );

    return Table(
      columnWidths: const {
        0: FlexColumnWidth(1), // العمود الأول يأخذ ثلث المساحة
        1: FlexColumnWidth(2), // العمود الثاني يأخذ ثلثي المساحة
      },
      children: [
        _buildTableRow(
          'Budget',
          AppHelpers.formatCurrency(movieDetailsEntity.budget),
          labelStyle,
          valueStyle,
        ),
        _buildTableRow(
          'Revenue',
          AppHelpers.formatCurrency(movieDetailsEntity.revenue),
          labelStyle,
          valueStyle,
        ),
        _buildTableRow(
          'Popularity',
          movieDetailsEntity.popularity.toStringAsFixed(0),
          labelStyle,
          valueStyle,
        ),
        _buildTableRow(
          'Vote Count',
          movieDetailsEntity.voteCount.toString(),
          labelStyle,
          valueStyle,
        ),
        _buildTableRow(
          'Original Language',
          movieDetailsEntity.originalLanguage.toUpperCase(),
          labelStyle,
          valueStyle,
        ),
      ],
    );
  }

  /// دالة مساعدة لإنشاء صف في الجدول
  TableRow _buildTableRow(
    String label,
    String value,
    TextStyle labelStyle,
    TextStyle valueStyle,
  ) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(label, style: labelStyle),
        ),
        Text(value, style: valueStyle, textAlign: TextAlign.start),
      ],
    );
  }

  /// ويدجت مساعد لإنشاء صف من أيقونة ونص
  Widget _buildIconText({
    required IconData icon,
    required String text,
    Color iconColor = Colors.white70,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// ويدجت مساعد لإنشاء قائمة من الـ Chips
  Widget _buildChipList({required String title, required List<String> items}) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: items
              .map(
                (item) => Chip(
                  label: Text(item),
                  backgroundColor: Colors.white.withOpacity(0.1),
                  labelStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  side: BorderSide(color: Colors.white.withOpacity(0.2)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
