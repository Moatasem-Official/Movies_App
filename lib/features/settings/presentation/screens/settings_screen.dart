import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_about_app_container.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_appearance_container.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_privacy_and_content_container.dart';
import 'package:movies_app/features/settings/presentation/widgets/custom_rating_and_support_container.dart';
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
              const CustomAppearanceContainer(),
              const SizedBox(height: 24),
              const CustomPrivacyAndContentContainer(),
              const SizedBox(height: 24),
              const CustomRatingAndSupportContainer(),
              const SizedBox(height: 24),
              const CustomAboutAppContainer(),
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
