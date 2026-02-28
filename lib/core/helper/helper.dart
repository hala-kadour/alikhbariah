import 'package:alikhbariah/core/services/supabase_service.dart';
import 'package:alikhbariah/translation/translation.dart';

class Helper {
  static String getTitleFromIndex(int index) {
    switch (index) {
      case 0:
        return 'Dashboard'.i18n;
      case 1:
        return 'Category'.i18n;
      case 2:
        return 'Posts'.i18n;
      case 3:
        return 'Notification'.i18n;
      default:
        return '';
    }
  }

  static String getTimeAsSting(DateTime time) {
    return "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}";
  }

  static Future<void> incrementView(String postId) async {
    final client = SupabaseService.client;
    await client.rpc('increment_post_views', params: {'post_id': postId});
  }
}
