import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/animation/empty_status_animation.dart';
import '../../../../core/widgets/animation/error_status_animation.dart';
import '../providers/home_providers.dart';
import '../widgets/loading_news_cards.dart';
import '../widgets/news_card.dart';

class BreakingNewsPage extends StatelessWidget {
  const BreakingNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.breaking_news.tr())),
      body: Consumer(
        builder: (context, ref, child) {
          final posts = ref.watch(breakingPostsProvider);

          return posts.when(
            data: (data) => ListView.builder(
              padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data.isEmpty) {
                  return EmptyStatusAnimation();
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
      ),
    );
  }
}
