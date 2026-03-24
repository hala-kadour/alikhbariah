import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helper/device_utility.dart';
import '../../../home/presentation/widgets/loading_news_cards.dart';
import '../../../home/presentation/widgets/loading_tab_bar.dart';
import '../../../home/presentation/widgets/news_card.dart';
import '../providers/explore_providers.dart';

class ExplorePage extends ConsumerStatefulWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.explore.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => context.pushNamed(AppRouteConfig.search),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: LocaleKeys.search_news.tr(),
                      prefixIcon: Icon(AppIcons.searchLight),
                      suffixIcon: Icon(AppIcons.filterLight),
                    ),
                  ),
                ),
              ),
              Gap.h24,
              categoriesAsync.when(
                loading: () => const LoadingTabBar(),
                error: (e, _) => Text("Error: $e"),
                data: (categories) {
                  final tabs = [
                    Tab(text: LocaleKeys.all.tr()),
                    ...categories.map((c) => Tab(text: c.name)),
                  ];
                  return DefaultTabController(
                    length: tabs.length,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          tabs: tabs,
                          onTap: (index) {
                            if (index == 0) {
                              ref
                                      .read(selectedCategoryIdProvider.notifier)
                                      .state =
                                  null;
                            } else {
                              final categoryId = categories[index - 1].id;
                              ref
                                      .read(selectedCategoryIdProvider.notifier)
                                      .state =
                                  categoryId;
                            }
                          },
                        ),
                        Gap.h16,
                        SizedBox(
                          // استخدمت Flexible أو حددت ارتفاع مناسب لتجنب الـ Overflow
                          height: DeviceUtility.getScreenHeight(context) * 0.6,
                          child: TabBarView(
                            children: List.generate(tabs.length, (_) {
                              final posts = ref.watch(filteredPostsProvider);

                              return posts.when(
                                data: (data) => ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) =>
                                      NewsCard(post: data[index]),
                                ),
                                error: (error, _) =>
                                    Center(child: Text("Error: $error")),
                                loading: () => const LoadingNewsCards(),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
