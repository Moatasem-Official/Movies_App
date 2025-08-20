class AppHelpers {
  static String formatDuration(DateTime releaseDate) {
    DateTime now = DateTime.now();
    Duration diff = releaseDate.difference(now);

    if (diff.isNegative) {
      return "Released";
    }

    int days = diff.inDays;
    int hours = diff.inHours.remainder(24);
    int minutes = diff.inMinutes.remainder(60);

    if (days > 0) {
      return "${days}d ${hours}h";
    } else {
      return "${hours}h ${minutes}m";
    }
  }
}
