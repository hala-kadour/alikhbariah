import 'package:alikhbariah/injection_container.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Helper {
  static String getTimeAsSting(DateTime time) {
    return "${time.year.toString()}-${time.month.toString()}-${time.day.toString()}";
  }

  static Future<void> incrementView(String postId) async {
    final client = sl<SupabaseClient>();
    await client.rpc('increment_post_views', params: {'post_id': postId});
  }

  static String? extractYoutubeId(String url) {
    String? id = YoutubePlayer.convertUrlToId(url);

    if (id == null && url.contains('/live/')) {
      final RegExp regExp = RegExp(r'/live/([^/?]+)');
      final match = regExp.firstMatch(url);
      if (match != null && match.groupCount >= 1) {
        id = match.group(1);
      }
    }
    return id;
  }
}
