import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/core/widgets/animation/empty_status_animation.dart';
import 'package:alikhbariah/core/widgets/animation/error_status_animation.dart';
import 'package:alikhbariah/core/widgets/animation/loading_status_animation.dart';
import 'package:alikhbariah/core/widgets/layout/navbar/main_back_app_bar.dart';
import 'package:alikhbariah/features/home/data/models/video/video_category_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../config/theme/app_icons.dart';
import '../../domain/usecases/get_videos_use_case.dart';
import '../providers/home_providers.dart';

class VideosPage extends ConsumerStatefulWidget {
  final VideoCategoryModel category;
  const VideosPage({super.key, required this.category});

  @override
  ConsumerState<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends ConsumerState<VideosPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // نأخذ القيمة الحالية من البروفايدر عند البدء
    _controller = TextEditingController(text: ref.read(videoSearchProvider));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = ref.watch(videoSearchProvider);
    final videosAsync = ref.watch(
      videosProvider(
        VideoSearchParam(
          categoryId: widget.category.id,
          searchQuery: searchQuery,
        ),
      ),
    );

    return Scaffold(
      appBar: MainBackAppBar(title: widget.category.name),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: TextFormField(
              controller: _controller,
              onChanged: (value) {
                ref.read(videoSearchProvider.notifier).state = value.isEmpty
                    ? null
                    : value;
              },
              onFieldSubmitted: (value) async {
                if (value.trim().isEmpty) return;
                ref.read(videoSearchProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.search_placeholder.tr(),
                prefixIcon: Icon(AppIcons.searchLight),
              ),
            ),
          ),
          Gap.h24,
          Expanded(
            child: videosAsync.when(
              data: (videos) {
                if (videos.isEmpty) {
                  return Center(
                    child: EmptyStatusAnimation(
                      title: LocaleKeys.empty_no_videos.tr(),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: videos.length,
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (context, index) {
                    final video = videos[index];
                    return Card(
                      elevation: 0.7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadiusDirectional.circular(8.0),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AspectRatio(
                                  aspectRatio: 2,
                                  child: Image.network(
                                    video.thumbnailUrl!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Icon(
                                  Icons.play_circle,
                                  color: AppColors.white.withValues(alpha: 0.8),
                                  size: 28.0,
                                ),
                              ],
                            ),
                          ),
                          title: Text(
                            video.title,
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurface,
                                ),
                          ),
                          onTap: () => _openFullScreenPlayer(
                            context,
                            video.youtubeVideoId,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: LoadingStatusAnimation()),
              error: (err, _) =>
                  Center(child: ErrorStatusAnimation(errorMessage: "$err")),
            ),
          ),
        ],
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
