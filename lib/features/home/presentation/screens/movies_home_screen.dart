import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/cubits/Movies_Module_States/movies_module_states.dart';
import 'package:movies_app/core/cubits/network/cubit/network_cubit.dart';
import 'package:movies_app/core/cubits/network/cubit/network_state.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/now_playing_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/upcomming_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_home_screen/custom_elements_row_title.dart';
import 'package:movies_app/features/home/presentation/widgets/public_widgets/custom_horizontal_list_view.dart';
import 'package:movies_app/features/home/presentation/widgets/movies_home_screen/custom_slider.dart';
import 'package:movies_app/core/utils/app_router.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen/custom_no_internet_widget.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_cubit.dart';
import 'package:movies_app/features/watch_list/presentation/controllers/cubit/add_movie_to_watch_list_as_local_data_state.dart';

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
          body: BlocConsumer<NetworkCubit, NetworkState>(
            listener: (context, state) {
              state.maybeWhen(
                connected: (_) {
                  connectedToInternetRefreshMethod(context);
                },
                orElse: () => false,
              );
            },
            builder: (context, state) {
              checkHomeScreenInternetConnection(
                context.read<NowPlayingMoviesCubit>().state,
                context.read<UpcommingMoviesCubit>().state,
                context.read<PopularMoviesCubit>().state,
                context.read<TopRatedMoviesCubit>().state,
                state,
              );

              return CustomScrollView(
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
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 50)),
                ],
              );
            },
          ),
        ));
  }

  void connectedToInternetRefreshMethod(BuildContext context) {
    context.read<NowPlayingMoviesCubit>().getNowPlayingMovies();
    context.read<UpcommingMoviesCubit>().getUpcommingMovies();
    context.read<PopularMoviesCubit>().getPopularMovies();
    context.read<TopRatedMoviesCubit>().getTopRatedMovies();
  }

  Widget checkHomeScreenInternetConnection(
      MoviesModuleStates nowPlayingState,
      MoviesModuleStates upcommingState,
      MoviesModuleStates popularState,
      MoviesModuleStates topRatedState,
      NetworkState state) {
    final isDisconnected = state.maybeWhen(
      disconnected: () => true,
      orElse: () => false,
    );

    // ✅ لو مفيش نت والكاش فاضي لكل الـ cubits
    bool isAllEmptyOrIdle(MoviesModuleStates s) =>
        s is Idle || s is Error || (s is Loaded && s.movies.isEmpty);

    if (isDisconnected &&
        isAllEmptyOrIdle(nowPlayingState) &&
        isAllEmptyOrIdle(upcommingState) &&
        isAllEmptyOrIdle(popularState) &&
        isAllEmptyOrIdle(topRatedState)) {
      return const CustomNoInternetWidget();
    }

    return const SizedBox.shrink();
  }
}
