import 'package:alikhbariah/injection_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Helper {
  static String getTimeAsSting(DateTime time) {
    return "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}";
  }

  static Future<void> incrementView(String postId) async {
    final client = sl<SupabaseClient>();
    await client.rpc('increment_post_views', params: {'post_id': postId});
  }
}
