import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/movie_details/domain/entities/movie_crew_entity.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_crew_dialog.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomCrewCard extends StatelessWidget {
  const CustomCrewCard({super.key, required this.member});

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
          showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.5),
            builder: (context) => CustomCrewDialog(member: member),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                    ? CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, child, loadingProgress) {
                          return const Center(
                              child: CircularProgressIndicator(strokeWidth: 2));
                        },
                        errorWidget: (context, error, stackTrace) =>
                            _buildPlaceholder(),
                      )
                    : _buildPlaceholder(),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              member.name ?? S.of(context).unknown,
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
            Text(
              member.job ?? S.of(context).unknown,
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
