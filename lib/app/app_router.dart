import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movie_details_screen/cubits/movie_details_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movie_details_screen/cubits/movie_videos_cubti.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/now_playing_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/popular_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movie_details_screen/cubits/similar_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/top_rated_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubits/upcomming_movies_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/app_home_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/movies_home_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/public_screens/see_all_elements_list_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/show_and_play_videos_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/splash_screen.dart';
import 'package:movies_app/Movies/movies_injection.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String appHomeScreen = '/appHomeScreen';
  static const String moviesHomeScreen = '/moviesHomeScreen';
  static const String seeAllElementsListScreen = '/seeAllElementsListScreen';
  static const String movieDetailsScreen = '/movieDetailsScreen';
  static const String showAndPlayVideosScreen = '/showAndPlayVideosScreen';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
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
            ],
            child: AppHomeScreen(),
          ),
        );
      case moviesHomeScreen:
        return MaterialPageRoute(builder: (_) => MoviesHomeScreen());
      case seeAllElementsListScreen:
        final arguments = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => SeeAllElementsListScreen(
            title: arguments["title"],
            cubit: arguments["cubit"],
          ),
        );
      case movieDetailsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<MovieDetailsCubit>(
                create: (_) =>
                    getIt<MovieDetailsCubit>()
                      ..getMovieDetails(movieId: args["id"]),
              ),
              BlocProvider<SimilarMoviesCubit>(
                create: (_) =>
                    getIt<SimilarMoviesCubit>()
                      ..getSimilarMovies(movieId: args["id"]),
              ),
              BlocProvider<MovieVideosCubti>(
                create: (_) =>
                    getIt<MovieVideosCubti>()
                      ..getMovieVideos(movieId: args["id"]),
              ),
            ],
            child: MovieDetailsScreen(movie: args["resultEntity"]),
          ),
        );
      case showAndPlayVideosScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<MovieVideosCubti>()
              ..getMovieVideos(movieId: args["id"]),
            child: ShowAndPlayVideosScreen(videos: args["videos"]),
          ),
        );
      default:
        return null;
    }
  }
}
