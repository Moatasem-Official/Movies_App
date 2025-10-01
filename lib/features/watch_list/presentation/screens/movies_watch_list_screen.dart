import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/discover_movies/presentation/helpers/custom_snack_bar_widget.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/custom_watch_list_grid.dart';
import 'package:movies_app/features/watch_list/presentation/widgets/custom_watch_list_sliver_app_bar.dart';
import 'package:movies_app/generated/l10n.dart';

class MoviesWatchListScreen extends StatelessWidget {
  const MoviesWatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMovieToWatchListAsLocalDataCubit,
        AddMovieToWatchListAsLocalDataState>(
      listener: (context, state) {
        state.maybeWhen(
          clearAllWatchlist: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                  message: S.of(context).clearWatchlistMessageSuccess),
            );
            context
                .read<AddMovieToWatchListAsLocalDataCubit>()
                .getAllWatchListMovies();
          },
          movieRemovedFromWatchlist: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar(
                  message: S.of(context).movieRemovedFromWatchlistMessage),
            );
            context
                .read<AddMovieToWatchListAsLocalDataCubit>()
                .getAllWatchListMovies();
          },
          error: (failure) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: Colors.red,
            ),
          ),
          orElse: () => null,
        );
      },
      child: const Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  CustomWatchListSliverAppBar(),
                  CustomWatchListGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
