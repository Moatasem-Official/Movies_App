import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_clear_watch_list_dialog.dart';
import 'custom_settings_section.dart';
import 'custom_settings_title.dart';
import '../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import '../../../../generated/l10n.dart';

class CustomPrivacyAndContentContainer extends StatelessWidget {
  const CustomPrivacyAndContentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSettingsSection(
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
    );
  }
}
