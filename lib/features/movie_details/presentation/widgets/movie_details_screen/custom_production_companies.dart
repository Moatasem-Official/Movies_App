import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_details_entity.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomProductionCompanies extends StatelessWidget {
  final MovieDetailsEntity movieDetailsEntity;

  const CustomProductionCompanies(
      {super.key, required this.movieDetailsEntity});

  @override
  Widget build(BuildContext context) {
    final companies = movieDetailsEntity.productionCompanies;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).productionCompanies,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        companies.isEmpty
            ? Center(
                child: Text(S.of(context).noProductionCompaniesFound,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 233, 233, 233),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
              )
            : SizedBox(
                height: 80, // ارتفاع محدد للقائمة الأفقية
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: companies.length,
                  itemBuilder: (context, index) {
                    final company = companies[index];
                    final logoPath = company['logo_path'];

                    return Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.9), // خلفية بيضاء للشعارات
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
}
