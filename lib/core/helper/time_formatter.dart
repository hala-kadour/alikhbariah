import 'package:i18n_extension/default.i18n.dart';

class TimeFormatter {
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return "Momments ago".i18n;
    }

    if (difference.inMinutes < 60) {
      return "${difference.inMinutes} Minutes ago".i18n;
    }

    if (difference.inHours < 24) {
      return "${difference.inHours} Hours ago";
    }

    if (difference.inDays < 7) {
      return "${difference.inDays} Days ago";
    }

    if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return "$weeks Weeks ago";
    }

    if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return "$months Months ago";
    }

    final years = (difference.inDays / 365).floor();
    return "$years years ago";
  }
}
