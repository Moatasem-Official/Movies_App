class AppHelpers {
  static String formatRuntime(int? runtimeMinutes) {
    if (runtimeMinutes == null || runtimeMinutes == 0) {
      return "Runtime not available";
    }

    int hours = runtimeMinutes ~/ 60;
    int minutes = runtimeMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return "${hours}h ${minutes}m";
    } else if (hours > 0) {
      return "${hours}h";
    } else {
      return "${minutes}m";
    }
  }
}
