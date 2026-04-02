import 'package:alikhbariah/core/widgets/animation/empty_status_animation.dart';
import 'package:alikhbariah/core/widgets/animation/error_status_animation.dart';
import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../loading_news_cards.dart';
import '../news_card.dart';

class FeaturedPostsViewCards extends StatelessWidget {
  const FeaturedPostsViewCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final posts = ref.watch(featuredPostsProvider);

        return posts.when(
          data: (data) => ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: data.length > 2 ? 2 : data.length,
            itemBuilder: (context, index) {
              if (data.isEmpty) {
                return Center(
                  child: EmptyStatusAnimation(
                    title: LocaleKeys.empty_no_news.tr(),
                  ),
                );
              } else {
                return NewsCard(post: data[index]);
              }
            },
          ),
          error: (error, _) =>
              Center(child: ErrorStatusAnimation(errorMessage: "$error")),
          loading: () => LoadingNewsCards(),
        );
      },
    );
  }
}
