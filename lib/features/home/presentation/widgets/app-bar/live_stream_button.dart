// ignore_for_file: use_build_context_synchronously

import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/core/helper/helper.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/snack-bar/custom_snack_bar.dart';
import '../../providers/home_providers.dart';

class LiveStreamButton extends ConsumerWidget {
  const LiveStreamButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 4.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red600,
          side: BorderSide.none,
        ),
        onPressed: () async {
          final liveStreamAsync = await ref.read(liveStreamProvider.future);

          try {
            if (liveStreamAsync != null) {
              final videoId = Helper.extractYoutubeId(liveStreamAsync);
              if (videoId != null) {
                context.pushNamed(AppRouteConfig.videoPlayer, extra: videoId);
              } else {
                CustomSnackBar.showError(
                  context,
                  LocaleKeys.errors_invalid_url_error,
                );
              }
            } else {
              CustomSnackBar.showError(
                context,
                LocaleKeys.errors_no_live_stream_now,
              );
            }
          } catch (e) {
            CustomSnackBar.showError(context, e.toString());
          }
        },
        label: Text(
          LocaleKeys.news_live_stream.tr(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
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
