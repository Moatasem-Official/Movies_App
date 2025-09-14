import 'package:flutter/material.dart';

class AppConstants {
  static const String kReadAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYzBjNzc0NGRiNDM1ZDU5MWQ5NzZlNjQyMmE5ZWY4ZSIsIm5iZiI6MTc1NTMwMzkxMC45ODg5OTk4LCJzdWIiOiI2ODlmY2ZlNjc2MTJkMDExYjg4NWI5MTMiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.36jw4ieqQj_9dXU5zXsa6KgfzZiMJ3ukQ0NUqCjuPQw';
  static const String kApiKey = '0c0c7744db435d591d976e6422a9ef8e';
  static const String kApiBaseUrl = 'https://api.themoviedb.org/3/';
  static const String imagePathUrl = "https://image.tmdb.org/t/p/w500";

  static const Map<int, Map<String, dynamic>> genreDetails = {
    28: {
      'icon': Icons.local_fire_department_rounded,
      'color': Color(0xFFD32F2F),
    },
    12: {
      'icon': Icons.explore_rounded,
      'color': Color(0xFF388E3C),
    },
    16: {
      'icon': Icons.auto_awesome_rounded,
      'color': Color(0xFF7B1FA2),
    },
    35: {
      'icon': Icons.sentiment_very_satisfied_rounded,
      'color': Color(0xFFFBC02D),
    },
    80: {
      'icon': Icons.fingerprint_rounded,
      'color': Color(0xFF455A64),
    },
    99: {
      'icon': Icons.camera_roll_rounded,
      'color': Color(0xFF616161),
    },
    18: {
      'icon': Icons.theater_comedy_rounded,
      'color': Color(0xFF0288D1),
    },
    10751: {
      'icon': Icons.family_restroom_rounded,
      'color': Color(0xFFF57C00),
    },
    14: {
      'icon': Icons.castle_rounded,
      'color': Color(0xFF512DA8),
    },
    36: {
      'icon': Icons.account_balance_rounded,
      'color': Color(0xFF6D4C41),
    },
    27: {
      'icon': Icons.nightlight_round,
      'color': Color(0xFF151515),
    },
    10402: {
      'icon': Icons.music_note_rounded,
      'color': Color(0xFFC2185B),
    },
    9648: {
      'icon': Icons.help_outline_rounded,
      'color': Color(0xFF00796B),
    },
    10749: {
      'icon': Icons.favorite_rounded,
      'color': Color(0xFFE91E63),
    },
    878: {
      'icon': Icons.rocket_launch_rounded,
      'color': Color(0xFF00BCD4),
    },
    10770: {
      'icon': Icons.tv_rounded,
      'color': Color(0xFF1976D2),
    },
    53: {
      'icon': Icons.bolt_rounded,
      'color': Color(0xFF546E7A),
    },
    10752: {
      'icon': Icons.shield_rounded,
      'color': Color(0xFF795548),
    },
    37: {
      'icon': Icons.wb_sunny_outlined,
      'color': Color(0xFFA1887F),
    },
  };
}
