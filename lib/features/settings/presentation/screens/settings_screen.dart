import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_app_rating.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_clear_watch_list_dialog.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_report_a_bug_dialog.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_divider.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_section.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_settings_title.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_suggest_a_feature_dialog.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_theme_dialog.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import 'package:movies_app/generated/l10n.dart';

const Color kGradientColorStart = Color(0xFF6A11CB);
const Color kGradientColorEnd = Color(0xFF2575FC);

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMovieToWatchListAsLocalDataCubit,
        AddMovieToWatchListAsLocalDataState>(
      listener: (context, state) {
        state.whenOrNull(
          clearAllWatchlist: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xFF2c5364),
                behavior: SnackBarBehavior.floating,
                padding: const EdgeInsets.all(10),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                dismissDirection: DismissDirection.down,
                elevation: 2,
                content: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(S.of(context).clearWatchlistMessageSuccess,
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
                duration: const Duration(seconds: 1),
              ),
            );
            context
                .read<AddMovieToWatchListAsLocalDataCubit>()
                .getAllWatchListMovies();
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).settings,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomSettingsSection(
                title: S.of(context).appearance,
                children: [
                  CustomSettingsTitle(
                    icon: CupertinoIcons.paintbrush_fill,
                    title: S.of(context).theme,
                    subtitle: S.of(context).dark,
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
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return const CustomLanguageDialog();
                          });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomSettingsSection(
                title: S.of(context).contentAndPrivacy,
                children: [
                  CustomSettingsTitle(
                    icon: CupertinoIcons.trash_fill,
                    title: S.of(context).clearWatchlist,
                    onTap: () async {
                      final shouldClear = await showDialog<bool>(
                        context: context,
                        builder: (context) => CustomConfirmationDialog(
                          title: S.of(context).clearWatchlist,
                          content: S.of(context).clearWatchlistConfirmation,
                          confirmText: S.of(context).clear,
                        ),
                      );

                      if (shouldClear ?? false) {
                        // ignore: use_build_context_synchronously
                        context
                            .read<AddMovieToWatchListAsLocalDataCubit>()
                            .clearAllMoviesFromWatchList();
                      }
                    },
                    isDestructive: true,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomSettingsSection(
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
              ),
              const SizedBox(height: 24),
              CustomSettingsSection(
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  S.of(context).version('1.0.0'),
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomLanguageDialog extends StatelessWidget {
  const CustomLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          S.of(context).selectLanguage,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(CupertinoIcons.globe, color: Colors.yellow),
          onTap: () {},
          title: Text(
            S.of(context).english,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(CupertinoIcons.globe, color: Colors.yellow),
          onTap: () {},
          title: Text(
            S.of(context).arabic,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
