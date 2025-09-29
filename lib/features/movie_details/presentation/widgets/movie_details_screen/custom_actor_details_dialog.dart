import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_cast_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_actor_dialog_row_item.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomActorDetailsDialog extends StatelessWidget {
  const CustomActorDetailsDialog({super.key, required this.actor});

  final MovieCastEntity actor;

  @override
  Widget build(BuildContext context) {
    final imageUrl = actor.profilePath != null
        ? '${AppConstants.imagePathUrl}${actor.profilePath}'
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
                actor.name ?? S.of(context).notAvailable,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                S.of(context).asPlusActorCharacter(
                    actor.character ?? S.of(context).unknown),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(color: Colors.white24),
              ),
              CustomActorDialogRowItem(
                icon: _getGenderIcon(actor.gender),
                label: S.of(context).gender,
                value: _getGenderString(actor.gender, context),
              ),
              const SizedBox(height: 10),
              CustomActorDialogRowItem(
                icon: Icons.work_outline,
                label: S.of(context).knownFor,
                value: actor.knownForDepartment ?? S.of(context).unknown,
              ),
              const SizedBox(height: 10),
              CustomActorDialogRowItem(
                icon: Icons.trending_up_rounded,
                label: S.of(context).popularity,
                value: actor.popularity.toStringAsFixed(2) ??
                    S.of(context).unknown,
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
                  child: Text(S.of(context).close,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getGenderString(int? gender, BuildContext context) {
    switch (gender) {
      case 1:
        return S.of(context).female;
      case 2:
        return S.of(context).male;
      default:
        return S.of(context).notSpecified;
    }
  }

  IconData _getGenderIcon(int? gender) {
    switch (gender) {
      case 1:
        return Icons.female_rounded;
      case 2:
        return Icons.male_rounded;
      default:
        return Icons.transgender_rounded;
    }
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey.shade800,
      child: const Center(
          child: Icon(Icons.person, color: Colors.white60, size: 60)),
    );
  }
}
