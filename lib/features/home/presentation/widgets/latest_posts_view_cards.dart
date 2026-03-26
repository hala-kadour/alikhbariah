import 'package:alikhbariah/core/widgets/animation/empty_status_animation.dart';
import 'package:alikhbariah/core/widgets/animation/error_status_animation.dart';
import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../translations/locale_keys.g.dart';
import 'loading_news_cards.dart';
import 'news_card.dart';

class LatestPostsViewCards extends StatelessWidget {
  const LatestPostsViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final posts = ref.watch(latestPostsProvider);

        return posts.when(
          data: (data) => ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.length > 3 ? 3 : data.length,
            itemBuilder: (context, index) {
              if (data.isEmpty) {
                return EmptyStatusAnimation(
                  title: LocaleKeys.empty_no_news.tr(),
                );
              } else {
                return NewsCard(post: data[index]);
              }
            },
          ),
          error: (error, _) =>
              ErrorStatusAnimation(errorMessage: "Error: $error"),
          loading: () => LoadingNewsCards(),
        );
      },
    );
  }
}
