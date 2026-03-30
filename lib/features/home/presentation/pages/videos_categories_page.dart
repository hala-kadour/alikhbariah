import 'package:alikhbariah/core/widgets/animation/loading_status_animation.dart';
import 'package:alikhbariah/core/widgets/layout/navbar/main_back_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/animation/empty_status_animation.dart';
import '../../../../core/widgets/animation/error_status_animation.dart';
import '../providers/home_providers.dart';
import '../widgets/video_category_card.dart';

class VideosCategoriesPage extends StatelessWidget {
  const VideosCategoriesPage({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBackAppBar(
        title: type.contains('program')
            ? LocaleKeys.news_programs.tr()
            : LocaleKeys.news_videos.tr(),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final posts = ref.watch(videosCategoriesProvider(type));

          return posts.when(
            data: (data) => GridView.builder(
              padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
              ),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data.isEmpty) {
                  return Center(
                    child: EmptyStatusAnimation(
                      title: LocaleKeys.empty_no_categories.tr(),
                    ),
                  );
                } else {
                  return VideoCategoryCard(category: data[index]);
                }
              },
            ),
            error: (error, _) =>
                Center(child: ErrorStatusAnimation(errorMessage: "$error")),
            loading: () => LoadingStatusAnimation(),
          );
        },
      ),
    );
  }
}
