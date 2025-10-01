import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_app_rating.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_section.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_title.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomAboutAppContainer extends StatelessWidget {
  const CustomAboutAppContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsSection(
      title: S.of(context).about,
      children: [
        CustomSettingsTitle(
          icon: CupertinoIcons.star_fill,
          title: S.of(context).rateApp,
          onTap: () {
            showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (_) {
                  return const RatingBottomSheet();
                });
          },
        ),
      ],
    );
  }
}
