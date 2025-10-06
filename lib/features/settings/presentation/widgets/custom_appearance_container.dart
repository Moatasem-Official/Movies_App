import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/lang/cubit/locale_cubit.dart';
import '../../../../core/cubits/theme/cubit/theme_cubit.dart';
import 'custom_language_dialog.dart';
import 'custom_settings_divider.dart';
import 'custom_settings_section.dart';
import 'custom_settings_title.dart';
import 'custom_theme_dialog.dart';
import '../../../../generated/l10n.dart';

class CustomAppearanceContainer extends StatelessWidget {
  const CustomAppearanceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsSection(
      title: S.of(context).appearance,
      children: [
        CustomSettingsTitle(
          icon: CupertinoIcons.paintbrush_fill,
          title: S.of(context).theme,
          subtitle: context.watch<ThemeCubit>().state.toString() ==
                  ThemeMode.light.toString()
              ? S.of(context).light
              : S.of(context).dark,
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return const CustomThemeDialog();
                });
          },
        ),
        const CustomSettingsDivider(),
        CustomSettingsTitle(
          icon: CupertinoIcons.globe,
          title: S.of(context).language,
          subtitle: context.watch<LocaleCubit>().state.languageCode == 'en'
              ? S.of(context).english
              : S.of(context).arabic,
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (_) {
                  return const CustomLanguageDialog();
                });
          },
        ),
      ],
    );
  }
}
