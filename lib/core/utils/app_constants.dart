import 'package:flutter/material.dart';

class AppConstants {
  static const String kReadAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYzBjNzc0NGRiNDM1ZDU5MWQ5NzZlNjQyMmE5ZWY4ZSIsIm5iZiI6MTc1NTMwMzkxMC45ODg5OTk4LCJzdWIiOiI2ODlmY2ZlNjc2MTJkMDExYjg4NWI5MTMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.36jw4ieqQj_9dXU5zXsa6KgfzZiMJ3ukQ0NUqCjuPQw';
  static const String kApiKey = '0c0c7744db435d591d976e6422a9ef8e';
  static const String kApiBaseUrl = 'https://api.themoviedb.org/3/';
  static const String imagePathUrl = "https://image.tmdb.org/t/p/w500";
  static const String watchListBoxName = "movies_watchlist";
  static const String kNowPlayingMoviesBoxName = "now_playing_movies";
  static const String kPopularMoviesBoxName = "popular_movies";
  static const String kTopRatedMoviesBoxName = "top_rated_movies";
  static const String kUpcomingMoviesBoxName = "upcoming_movies";
  static const String kDiscoverMoviesCategoriesBoxName =
      "all_movies_categories";

  static const Map<int, Map<String, dynamic>> genreDetails = {
    27: {
      'icon': Icons.nightlight_round,
      'color': Color(0xFF070E18),
    },
    80: {
      'icon': Icons.fingerprint_rounded,
      'color': Color(0xFF0A1520),
    },
    53: {
      'icon': Icons.bolt_rounded,
      'color': Color(0xFF0D1A28),
    },
    10752: {
      'icon': Icons.shield_rounded,
      'color': Color(0xFF101F30),
    },
    36: {
      'icon': Icons.account_balance_rounded,
      'color': Color(0xFF132538),
    },
    99: {
      'icon': Icons.camera_roll_rounded,
      'color': Color(0xFF162A40),
    },
    18: {
      'icon': Icons.theater_comedy_rounded,
      'color': Color(0xFF1A3049),
    },
    9648: {
      'icon': Icons.help_outline_rounded,
      'color': Color(0xFF1D3651),
    },
    28: {
      'icon': Icons.local_fire_department_rounded,
      'color': Color(0xFF213B59),
    },
    12: {
      'icon': Icons.explore_rounded,
      'color': Color(0xFF244061),
    },
    878: {
      'icon': Icons.rocket_launch_rounded,
      'color': Color(0xFF274569),
    },
    37: {
      'icon': Icons.wb_sunny_outlined,
      'color': Color(0xFF2B4B71),
    },
    14: {
      'icon': Icons.castle_rounded,
      'color': Color(0xFF2E5079),
    },
    10751: {
      'icon': Icons.family_restroom_rounded,
      'color': Color(0xFF325581),
    },
    16: {
      'icon': Icons.auto_awesome_rounded,
      'color': Color(0xFF355B89),
    },
    35: {
      'icon': Icons.sentiment_very_satisfied_rounded,
      'color': Color(0xFF396091),
    },
    10402: {
      'icon': Icons.music_note_rounded,
      'color': Color(0xFF3C6699),
    },
    10749: {
      'icon': Icons.favorite_rounded,
      'color': Color(0xFF406BA1),
    },
    10770: {
      'icon': Icons.tv_rounded,
      'color': Color(0xFF4371A9),
    },
  };
}
