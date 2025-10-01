import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/utils/app_constants.dart';
import 'package:movies_app/features/discover_movies/presentation/controllers/cubit/discover_movies_cubit.dart';
import 'package:movies_app/features/discover_movies/presentation/helpers/movies_categories_language_converter.dart';
import 'package:movies_app/features/discover_movies/presentation/widgets/discover_skeletonizer_loading_widgets/skeleton_genre_card.dart';
import 'package:movies_app/features/discover_movies/presentation/widgets/show_and_search_movies_of_category_screen/custom_discover_genre_card.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DiscoverMoviesScreen extends StatelessWidget {
  const DiscoverMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).discover,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<DiscoverMoviesCubit, MoviesModuleStates>(
          builder: (context, state) {
            return state.whenOrNull(
                  idle: () => const SizedBox.shrink(),
                  loading: () {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return const SkeletonGenreCard();
                      },
                    );
                  },
                  error: (failure) => Center(
                    child: Text(
                      failure.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  loaded: (moviesCategories) {
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                      ),
                      itemCount: moviesCategories.genres.length,
                      itemBuilder: (context, index) {
                        final genreFromApi = moviesCategories.genres[index];

                        final style =
                            AppConstants.genreDetails[genreFromApi.id];

                        final color =
                            style?['color'] as Color? ?? Colors.grey.shade800;
                        final icon =
                            style?['icon'] as IconData? ?? Icons.movie_rounded;

                        return CustomDiscoverGenreCard(
                          genreName: getGenreName(context, genreFromApi.name),
                          genreId: genreFromApi.id,
                          genreColor: color,
                          genreIcon: icon,
                        );
                      },
                    );
                  },
                ) ??
                const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
