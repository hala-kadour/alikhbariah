import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/core/widgets/containers/custom_tag_container.dart';
import 'package:alikhbariah/features/explore/presentation/providers/explore_providers.dart';
import 'package:alikhbariah/features/home/domain/models/tag/tag_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../home/presentation/widgets/loading_news_cards.dart';
import '../../../home/presentation/widgets/news_card.dart';

class TagSearchPage extends ConsumerWidget {
  const TagSearchPage({super.key, required this.tag});
  final TagModel tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var posts = ref.watch(tagPostsProvider(tag.id));
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            CustomTagContainer(tag: tag),
            Gap.h16,
            Text("${posts.value?.length ?? 0} News"),
            Gap.h16,
            posts.when(
              skipLoadingOnReload: true,
              skipLoadingOnRefresh: true,
              data: (data) => Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => NewsCard(post: data[index]),
                ),
              ),
              error: (error, stackTrace) => Text("Error $error"),
              loading: () => Expanded(child: LoadingNewsCards()),
            ),
          ],
        ),
      ),
    );
  }
}
