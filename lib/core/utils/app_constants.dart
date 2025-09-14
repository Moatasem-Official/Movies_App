import 'package:flutter/material.dart';

class AppConstants {
  static const String kReadAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYzBjNzc0NGRiNDM1ZDU5MWQ5NzZlNjQyMmE5ZWY4ZSIsIm5iZiI6MTc1NTMwMzkxMC45ODg5OTk4LCJzdWIiOiI2ODlmY2ZlNjc2MTJkMDExYjg4NWI5MTMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.36jw4ieqQj_9dXU5zXsa6KgfzZiMJ3ukQ0NUqCjuPQw';
  static const String kApiKey = '0c0c7744db435d591d976e6422a9ef8e';
  static const String kApiBaseUrl = 'https://api.themoviedb.org/3/';
  static const String imagePathUrl = "https://image.tmdb.org/t/p/w500";

  static const Map<int, Map<String, dynamic>> genreDetails = {
    27: {
      'icon': Icons.nightlight_round,
      'color': Color(0xFF0F2038),
    },
    80: {
      'icon': Icons.fingerprint_rounded,
      'color': Color(0xFF152A4A),
    },
    53: {
      'icon': Icons.bolt_rounded,
      'color': Color(0xFF1A355A),
    },
    10752: {
      'icon': Icons.shield_rounded,
      'color': Color(0xFF1B2E4B),
    },
    36: {
      'icon': Icons.account_balance_rounded,
      'color': Color(0xFF233B5E),
    },
    99: {
      'icon': Icons.camera_roll_rounded,
      'color': Color(0xFF35588F),
    },
    18: {
      'icon': Icons.theater_comedy_rounded,
      'color': Color(0xFF2A4C7A),
    },
    9648: {
      'icon': Icons.help_outline_rounded,
      'color': Color(0xFF1E3A5F),
    },
    28: {
      'icon': Icons.local_fire_department_rounded,
      'color': Color(0xFF3C619A),
    },
    12: {
      'icon': Icons.explore_rounded,
      'color': Color(0xFF4871B2),
    },
    878: {
      'icon': Icons.rocket_launch_rounded,
      'color': Color(0xFF4269A6),
    },
    37: {
      'icon': Icons.wb_sunny_outlined,
      'color': Color(0xFF305182),
    },
    14: {
      'icon': Icons.castle_rounded,
      'color': Color(0xFF25416B),
    },
    10751: {
      'icon': Icons.family_restroom_rounded,
      'color': Color(0xFF5581CA),
    },
    16: {
      'icon': Icons.auto_awesome_rounded,
      'color': Color(0xFF6291E2),
    },
    35: {
      'icon': Icons.sentiment_very_satisfied_rounded,
      'color': Color(0xFF70A1FA),
    },
    10402: {
      'icon': Icons.music_note_rounded,
      'color': Color(0xFF5B89D6),
    },
    10749: {
      'icon': Icons.favorite_rounded,
      'color': Color(0xFF6899EE),
    },
    10770: {
      'icon': Icons.tv_rounded,
      'color': Color(0xFF4E79BE),
    },
  };
}
