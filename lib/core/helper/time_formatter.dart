import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';

class TimeFormatter {
  static String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inSeconds < 60) {
      return LocaleKeys.time_moments_ago.tr();
    }

    if (difference.inMinutes < 60) {
      return LocaleKeys.time_moments_ago.tr();
    }

    if (difference.inHours < 24) {
      return LocaleKeys.time_hours_ago.tr(
        args: [difference.inHours.toString()],
      );
    }

    if (difference.inDays < 7) {
      return LocaleKeys.time_days_ago.tr(args: [difference.inDays.toString()]);
    }

    if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return LocaleKeys.time_weeks_ago.tr(args: [weeks.toString()]);
    }

    if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return LocaleKeys.time_months_ago.tr(args: [months.toString()]);
    }

    final years = (difference.inDays / 365).floor();
    return LocaleKeys.time_years_ago.tr(args: [years.toString()]);
  }
}
