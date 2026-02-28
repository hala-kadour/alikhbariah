import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            itemCount: data.length,
            itemBuilder: (context, index) => NewsCard(post: data[index]),
          ),
          error: (error, _) => Text("Error: $error"),
          loading: () => LoadingNewsCards(),
        );
      },
    );
  }
}
