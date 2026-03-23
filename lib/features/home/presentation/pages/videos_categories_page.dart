import 'package:alikhbariah/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/animation/empty_status_animation.dart';
import '../../../../core/widgets/animation/error_status_animation.dart';
import '../providers/home_providers.dart';
import '../widgets/loading_news_cards.dart';
import '../widgets/video_category_card.dart';

class VideosCategoriesPage extends StatelessWidget {
  const VideosCategoriesPage({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          type.contains('program') ? "Programs".i18n : "News Videos".i18n,
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final posts = ref.watch(videosCategoriesProvider(type));

          return posts.when(
            data: (data) => GridView.builder(
              padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data.isEmpty) {
                  return EmptyStatusAnimation();
                } else {
                  return VideoCategoryCard(category: data[index]);
                }
              },
            ),
            error: (error, _) =>
                ErrorStatusAnimation(errorMessage: "Error: $error"),
            loading: () => LoadingNewsCards(),
          );
        },
      ),
    );
  }
}
