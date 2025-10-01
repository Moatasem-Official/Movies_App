import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_report_a_bug_dialog.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_divider.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_section.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_title.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_suggest_a_feature_dialog.dart';
import 'package:movies_app/generated/l10n.dart';

class CustomRatingAndSupportContainer extends StatelessWidget {
  const CustomRatingAndSupportContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsSection(
      title: S.of(context).feedbackAndSupport,
      children: [
        CustomSettingsTitle(
          icon: CupertinoIcons.ant_fill,
          title: S.of(context).reportABug,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const ReportBugBottomSheet(),
            );
          },
        ),
        const CustomSettingsDivider(),
        CustomSettingsTitle(
          icon: CupertinoIcons.lightbulb_fill,
          title: S.of(context).suggestAFeature,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const SuggestFeatureBottomSheet(),
            );
          },
        ),
      ],
    );
  }
}
