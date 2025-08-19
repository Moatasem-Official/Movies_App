import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/controllers/movies_home_screen/cubit/movies_home_screen_cubit.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/app_home_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/movie_details_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/movies_home_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/see_all_elements_list_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/splash_screen.dart';
import 'package:movies_app/Movies/movies_injection.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String appHomeScreen = '/appHomeScreen';
  static const String moviesHomeScreen = '/moviesHomeScreen';
  static const String seeAllElementsListScreen = '/seeAllElementsListScreen';
  static const String movieDetailsScreen = '/movieDetailsScreen';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case appHomeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<MoviesHomeScreenCubit>(
                create: (_) => getIt<MoviesHomeScreenCubit>()
                  ..getNowPlayingMovies()
                  ..getPopularMovies()
                  ..getTopRatedMovies(),
              ),
            ],
            child: AppHomeScreen(),
          ),
        );
      case moviesHomeScreen:
        return MaterialPageRoute(builder: (_) => MoviesHomeScreen());
      case seeAllElementsListScreen:
        return MaterialPageRoute(builder: (_) => SeeAllElementsListScreen());
      case movieDetailsScreen:
        return MaterialPageRoute(builder: (_) => MovieDetailsScreen());
      default:
        return null;
    }
  }
}
