import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_crew_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_actor_dialog_row_item.dart';

class CustomCrewDialog extends StatelessWidget {
  const CustomCrewDialog({super.key, required this.member});

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
