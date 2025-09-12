import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/discover_movies/presentation/screens/discover_movies_screen.dart';
import 'package:movies_app/features/discover_movies/presentation/screens/show_and_search_movies_of_category_screen.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_credits_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/movie_videos_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/now_playing_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/controllers/movie_details_screen/cubits/similar_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/controllers/movies_home_screen/cubits/upcomming_movies_cubit.dart';
import 'package:movies_app/features/home/presentation/screens/app_home_screen.dart';
import 'package:movies_app/features/movie_details/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/features/home/presentation/screens/movies_home_screen.dart';
import 'package:movies_app/features/movie_videos/presentation/controllers/cubit/all_movie_videos_cubit.dart';
import 'package:movies_app/features/movies_search/presentation/controllers/cubit/movies_search_cubit.dart';
import 'package:movies_app/features/movies_search/presentation/screens/search_all_movies_screen.dart';
import 'package:movies_app/features/see_all_movies/presentation/controllers/cubit/see_all_movies_cubit.dart';
import 'package:movies_app/features/see_all_movies/presentation/screen/see_all_elements_list_screen.dart';
import 'package:movies_app/features/movie_videos/presentation/screens/show_and_play_videos_screen.dart';
import 'package:movies_app/features/home/presentation/screens/splash_screen.dart';
import 'package:movies_app/core/utils/service_locator.dart';
import 'package:movies_app/features/watch_list/presentation/screens/movies_watch_list_screen.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String appHomeScreen = '/appHomeScreen';
  static const String moviesHomeScreen = '/moviesHomeScreen';
  static const String seeAllElementsListScreen = '/seeAllElementsListScreen';
  static const String movieDetailsScreen = '/movieDetailsScreen';
  static const String showAndPlayVideosScreen = '/showAndPlayVideosScreen';
  static const String searchAllMoviesScreen = '/searchAllMoviesScreen';
  static const String discoverMoviesScreen = '/discoverMoviesScreen';
  static const String showAndSearchMoviesOfCategoryScreen =
      '/showAndSearchMoviesOfCategoryScreen';
  static const String moviesWatchListScreen = '/moviesWatchListScreen';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case appHomeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<NowPlayingMoviesCubit>(
                create: (_) =>
                    getIt<NowPlayingMoviesCubit>()..getNowPlayingMovies(),
              ),
              BlocProvider<PopularMoviesCubit>(
                create: (_) => getIt<PopularMoviesCubit>()..getPopularMovies(),
              ),
              BlocProvider<TopRatedMoviesCubit>(
                create: (_) =>
                    getIt<TopRatedMoviesCubit>()..getTopRatedMovies(),
              ),
              BlocProvider<UpcommingMoviesCubit>(
                create: (_) =>
                    getIt<UpcommingMoviesCubit>()..getUpcommingMovies(),
              ),
              BlocProvider<MoviesSearchCubit>(
                create: (_) => getIt<MoviesSearchCubit>(),
              ),
            ],
            child: const AppHomeScreen(),
          ),
        );
      case moviesHomeScreen:
        return MaterialPageRoute(builder: (_) => const MoviesHomeScreen());
      case seeAllElementsListScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SeeAllMoviesCubit>(
                create: (_) => getIt<SeeAllMoviesCubit>()
                  ..getSeeAllMovies(arguments["movie_type"], 1),
              ),
            ],
            child: SeeAllElementsListScreen(title: arguments["title"]),
          ),
        );
      case movieDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<MovieDetailsCubit>(
                create: (_) => getIt<MovieDetailsCubit>()
                  ..getMovieDetails(movieId: args["id"]),
              ),
              BlocProvider<MovieCreditsCubit>(
                create: (_) => getIt<MovieCreditsCubit>()
                  ..getMovieCredits(movieId: args["id"]),
              ),
              BlocProvider<SimilarMoviesCubit>(
                create: (_) => getIt<SimilarMoviesCubit>()
                  ..getSimilarMovies(movieId: args["id"]),
              ),
              BlocProvider<MovieVideosCubit>(
                create: (_) => getIt<MovieVideosCubit>()
                  ..getMovieVideos(movieId: args["id"]),
              ),
            ],
            child: MovieDetailsScreen(movie: args["resultEntity"]),
          ),
        );
      case showAndPlayVideosScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AllMovieVideosCubit>(
            create: (_) => getIt<AllMovieVideosCubit>()
              ..getMovieVideos(movieId: args["id"]),
            child: ShowAndPlayVideosScreen(videoIndex: args["videoIndex"]),
          ),
        );
      case searchAllMoviesScreen:
        return MaterialPageRoute(builder: (_) => const SearchAllMoviesScreen());
      case discoverMoviesScreen:
        return MaterialPageRoute(builder: (_) => const DiscoverMoviesScreen());
      case showAndSearchMoviesOfCategoryScreen:
        return MaterialPageRoute(
            builder: (_) => const ShowAndSearchMoviesOfCategoryScreen());
      case moviesWatchListScreen:
        return MaterialPageRoute(builder: (_) => const MoviesWatchListScreen());
      default:
        return null;
    }
  }
}
