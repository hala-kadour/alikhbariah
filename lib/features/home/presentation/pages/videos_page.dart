import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/features/home/data/models/video/video_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../translation/translation.dart';
import '../providers/home_providers.dart';

class VideosPage extends ConsumerWidget {
  final VideoCategoryModel category;
  const VideosPage({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videosAsync = ref.watch(videosProvider(category.id));

    return Scaffold(
      appBar: AppBar(title: Text(category.name)),
      body: videosAsync.when(
        data: (videos) {
          if (videos.isEmpty) {
            return Center(
              child: Text("No videos available in this category".i18n),
            );
          }
          return ListView.builder(
            itemCount: videos.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final video = videos[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                    video.thumbnailUrl!,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(video.title),
                  onTap: () =>
                      _openFullScreenPlayer(context, video.youtubeVideoId),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error : $err")),
      ),
    );
  }

  void _openFullScreenPlayer(BuildContext context, String videoUrl) {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    if (videoId != null) {
      context.pushNamed(AppRouteConfig.videoPlayer, extra: videoId);
    }
  }
}
