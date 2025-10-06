import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controllers/movies_home_screen/cubits/now_playing_movies_cubit.dart';
import '../controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import '../controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import '../controllers/movies_home_screen/cubits/upcomming_movies_cubit.dart';
import '../widgets/movies_home_screen/custom_elements_row_title.dart';
import '../widgets/public_widgets/custom_horizontal_list_view.dart';
import '../widgets/movies_home_screen/custom_slider.dart';
import '../../../../core/utils/app_router.dart';
import '../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import '../../../watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

import '../../../../generated/l10n.dart';

class MoviesHomeScreen extends StatelessWidget {
  const MoviesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddMovieToWatchListAsLocalDataCubit,
            AddMovieToWatchListAsLocalDataState>(
        listener: (context, state) {
          state.whenOrNull(
              movieAddedToWatchlist: (message) {
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
                        Text(S.of(context).movieAddedToWatchlistMessage,
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              movieRemovedFromWatchlist: (message) =>
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
                          Text(S.of(context).movieRemovedFromWatchlistMessage,
                              style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  ));
        },
        child: Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomSlider(
                title: S.of(context).nowPlaying,
                cubit: context.read<NowPlayingMoviesCubit>(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
            SliverToBoxAdapter(
              child: CustomTitleOfListOfElements(
                title: S.of(context).popularMovies,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRouter.seeAllElementsListScreen,
                  arguments: {
                    "title": S.of(context).popularMovies,
                    "movie_type": "popular"
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: CustomHorizontalListView(
                cubit: context.read<PopularMoviesCubit>(),
                moviesState: context.read<PopularMoviesCubit>().state,
                whenConnectedFunction:
                    context.read<PopularMoviesCubit>().getPopularMovies,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: CustomTitleOfListOfElements(
                title: S.of(context).topRatedMovies,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRouter.seeAllElementsListScreen,
                  arguments: {
                    "title": S.of(context).topRatedMovies,
                    "movie_type": "top_rated",
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: CustomHorizontalListView(
                cubit: context.read<TopRatedMoviesCubit>(),
                moviesState: context.read<TopRatedMoviesCubit>().state,
                whenConnectedFunction:
                    context.read<TopRatedMoviesCubit>().getTopRatedMovies,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverToBoxAdapter(
              child: CustomTitleOfListOfElements(
                title: S.of(context).upcomingMovies,
                onTap: () => Navigator.pushNamed(
                  context,
                  AppRouter.seeAllElementsListScreen,
                  arguments: {
                    "title": S.of(context).upcomingMovies,
                    "movie_type": "upcoming",
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: CustomHorizontalListView(
                cubit: context.read<UpcommingMoviesCubit>(),
                moviesState: context.read<UpcommingMoviesCubit>().state,
                whenConnectedFunction:
                    context.read<UpcommingMoviesCubit>().getUpcommingMovies,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 50)),
          ],
        )));
  }
}
