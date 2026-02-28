import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/core/widgets/loadings/loading_tags.dart';
import 'package:alikhbariah/features/explore/presentation/providers/explore_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/theme/app_icons.dart';
import '../../../../core/providers/recent_search_provider.dart';
import '../../../../core/widgets/containers/custom_tag_container.dart';
import '../../../../core/widgets/layout/navbar/main_back_app_bar.dart';
import '../../../../translation/translation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBackAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => context.pushNamed(AppRouteConfig.actaulSearch),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "search title, summary, location ...".i18n,
                    prefixIcon: Icon(AppIcons.searchLight),
                    suffixIcon: Icon(AppIcons.filterLight),
                  ),
                ),
              ),
            ),
            Gap.h24,
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Recent search".i18n,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Consumer(
                  builder: (context, ref, child) => TextButton(
                    onPressed: () =>
                        ref.watch(recentSearchProvider.notifier).clearAll(),
                    child: Text('Clear All'.i18n),
                  ),
                ),
              ],
            ),
            Gap.h16,
            Consumer(
              builder: (context, ref, child) {
                final searches = ref.watch(recentSearchProvider);

                if (searches.isEmpty) {
                  return const SizedBox();
                }

                return Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: searches.map((text) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).inputDecorationTheme.fillColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        spacing: 8.0,

                        mainAxisSize: .min,
                        children: [
                          Icon(AppIcons.timeCircleLight),
                          Text(text),
                          Gap.w8,
                          GestureDetector(
                            onTap: () => ref
                                .watch(recentSearchProvider.notifier)
                                .removeSearch(text),
                            child: Icon(Icons.close),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            Gap.h24,
            Text(
              "Popular tags".i18n,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Gap.h16,
            Consumer(
              builder: (context, ref, child) {
                var res = ref.watch(popularTagsProvider);
                return res.when(
                  data: (data) => Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: List.generate(
                      data.length,
                      (index) => CustomTagContainer(tag: data[index]),
                    ),
                  ),
                  error: (error, stackTrace) => Text("Error $error"),
                  loading: () => LoadingTags(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
