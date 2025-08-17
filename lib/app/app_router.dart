import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/movies_home_screen.dart';
import 'package:movies_app/Movies/features/display_different_movies_types/presentation/screens/splash_screen.dart';

class AppRouter {
  static const String splashScreen = '/';
  static const String moviesHomeScreen = '/moviesHomeScreen';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case moviesHomeScreen:
        return MaterialPageRoute(builder: (_) => MoviesHomeScreen());
      default:
        return null;
    }
  }
}
