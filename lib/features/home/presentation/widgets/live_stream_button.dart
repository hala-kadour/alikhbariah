import 'dart:developer';

import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LiveStreamButton extends StatelessWidget {
  const LiveStreamButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.directional(bottom: 4.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red600,
          side: .none,
        ),
        onPressed: () {
          const String rawUrl = "https://www.youtube.com/watch?v=EujQMck-I6g";

          final videoId = YoutubePlayer.convertUrlToId(rawUrl);
          log(videoId ?? " No ID !!");

          if (videoId != null) {
            context.pushNamed(AppRouteConfig.videoPlayer, extra: videoId);
          }
        },
        label: Text(
          LocaleKeys.news_live_stream.tr(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: .w700,
          ),
        ),
        icon: Icon(
          Icons.cell_tower,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
