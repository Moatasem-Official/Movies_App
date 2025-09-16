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
                    Text(message, style: const TextStyle(color: Colors.white)),
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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomSettingsSection(
                title: 'Appearance',
                children: [
                  CustomSettingsTitle(
                    icon: CupertinoIcons.paintbrush_fill,
                    title: 'Theme',
                    subtitle: 'Dark',
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return const CustomThemeDialog();
                          });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomSettingsSection(
                title: 'Content & Privacy',
                children: [
                  CustomSettingsTitle(
                    icon: CupertinoIcons.trash_fill,
                    title: 'Clear Watchlist',
                    onTap: () async {
                      final shouldClear = await showDialog<bool>(
                        context: context,
                        builder: (context) => const CustomConfirmationDialog(
                          title: 'Clear Watchlist',
                          content:
                              'Are you sure you want to permanently clear the watchlist?',
                          confirmText: 'Clear',
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
                title: 'Feedback & Support',
                children: [
                  CustomSettingsTitle(
                    icon: CupertinoIcons.ant_fill,
                    title: 'Report a Bug',
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
                    title: 'Suggest a Feature',
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
                title: 'About',
                children: [
                  CustomSettingsTitle(
                    icon: CupertinoIcons.star_fill,
                    title: 'Rate App',
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Text(
                  'Version 1.0.0',
                  style: TextStyle(
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
