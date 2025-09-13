// lib/features/movie_details/presentation/widgets/custom_movie_crew.dart

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_crew_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_actor_dialog_row_item.dart';

class CustomMovieCrew extends StatelessWidget {
  // استقبل قائمة مفلترة وجاهزة
  const CustomMovieCrew({super.key, required this.crew});

  final List<MovieCrewEntity> crew;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 190, // ارتفاع مناسب
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: crew.length,
              itemBuilder: (context, index) {
                final member = crew[index];
                return _CrewCard(member: member);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CrewCard extends StatelessWidget {
  const _CrewCard({required this.member});

  final MovieCrewEntity member;

  @override
  Widget build(BuildContext context) {
    final imageUrl = member.profilePath != null
        ? '${AppConstants.imagePathUrl}${member.profilePath}'
        : null;

    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () {
          // عرض Dialog التفاصيل عند الضغط
          showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.5),
            builder: (context) => _CrewDetailsDialog(member: member),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- تصميم الصورة مطابق تماماً لكارت الممثل ---
            Container(
              height: 130,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: imageUrl != null
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2));
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            _buildPlaceholder(),
                      )
                    : _buildPlaceholder(),
              ),
            ),
            const SizedBox(height: 10),

            // --- اسم الشخص ---
            Text(
              member.name ?? 'N/A',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),

            // --- الوظيفة بدلاً من اسم الشخصية ---
            Text(
              member.job ?? 'N/A',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade800,
      child: const Center(
        child: Icon(Icons.person, color: Colors.white60, size: 50),
      ),
    );
  }
}

class _CrewDetailsDialog extends StatelessWidget {
  const _CrewDetailsDialog({required this.member});

  final MovieCrewEntity member;

  @override
  Widget build(BuildContext context) {
    final imageUrl = member.profilePath != null
        ? '${AppConstants.imagePathUrl}${member.profilePath}'
        : null;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.grey.shade900.withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- صورة الشخص ---
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5), blurRadius: 10)
                  ],
                ),
                child: ClipOval(
                  child: imageUrl != null
                      ? Image.network(imageUrl, fit: BoxFit.cover)
                      : _buildPlaceholder(),
                ),
              ),
              const SizedBox(height: 16),

              // --- اسم الشخص ---
              Text(
                member.name ?? 'Not Available',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(color: Colors.white24),
              ),

              // --- استخدام الويدجت الجاهزة لعرض التفاصيل ---
              CustomActorDialogRowItem(
                icon: Icons.business_center_outlined,
                label: 'Department',
                value: member.department ?? 'N/A',
              ),
              const SizedBox(height: 10),
              CustomActorDialogRowItem(
                icon: Icons.star_outline_rounded,
                label: 'Job',
                value: member.job ?? 'N/A',
              ),
              const SizedBox(height: 24),

              // --- زر الإغلاق ---
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white.withOpacity(0.1),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade800,
      child: const Center(
          child: Icon(Icons.person, color: Colors.white60, size: 60)),
    );
  }
}
