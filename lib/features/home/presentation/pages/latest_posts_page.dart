import 'package:alikhbariah/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/animation/empty_status_animation.dart';
import '../../../../core/widgets/animation/error_status_animation.dart';
import '../providers/home_providers.dart';
import '../widgets/loading_news_cards.dart';
import '../widgets/news_card.dart';

class LatestPostsPage extends StatelessWidget {
  const LatestPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Latest Posts".i18n)),
      body: Consumer(
        builder: (context, ref, child) {
          final posts = ref.watch(latestPostsProvider);

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
