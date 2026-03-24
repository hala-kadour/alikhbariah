import 'package:alikhbariah/features/home/presentation/widgets/loading_news_cards.dart';
import 'package:alikhbariah/features/home/presentation/widgets/news_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/theme/app_icons.dart';
import '../../../../core/providers/recent_search_provider.dart';
import '../../../../core/widgets/layout/navbar/main_back_app_bar.dart';
import '../providers/explore_providers.dart';

class ActaulSearchPage extends ConsumerWidget {
  const ActaulSearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchProvider);
    final posts = ref.watch(searchedPostsProvider);

    return Scaffold(
      appBar: MainBackAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              autofocus: true,
              initialValue: searchQuery,
              onChanged: (value) {
                ref.read(searchProvider.notifier).state = value.isEmpty
                    ? null
                    : value;
              },
              onFieldSubmitted: (value) async {
                if (value.trim().isEmpty) return;
                ref.read(recentSearchProvider.notifier).addSearch(value);
                ref.read(searchProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.search_placeholder.tr(),
                prefixIcon: Icon(AppIcons.searchLight),
                suffixIcon: Icon(AppIcons.filterLight),
              ),
            ),
            Gap.h24,
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
              loading: () => LoadingNewsCards(),
            ),
          ],
        ),
      ),
    );
  }
}
