import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/generated/locale_keys.g.dart';

class TimeFormatter {
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return LocaleKeys.moments_ago.tr();
    }

    if (difference.inMinutes < 60) {
      return LocaleKeys.moments_ago.tr();
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
