import 'package:alikhbariah/core/widgets/layout/navbar/main_back_app_bar.dart';
import 'package:alikhbariah/features/home/presentation/widgets/featured-posts/featured_posts_filter_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/theme/app_icons.dart';
import '../../../../core/widgets/animation/empty_status_animation.dart';
import '../../../../core/widgets/animation/error_status_animation.dart';
import '../providers/home_providers.dart';
import '../widgets/loading_news_cards.dart';
import '../widgets/news_card.dart';

class FeaturedPostsPage extends StatelessWidget {
  const FeaturedPostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBackAppBar(
        title: LocaleKeys.news_featured.tr(),
        action: IconButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => const FeaturedPostsFilterDialog(),
          ),
          icon: Icon(AppIcons.filterLight),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final posts = ref.watch(featuredPostsProvider);

          return posts.when(
            data: (data) {
              if (data.isEmpty) {
                return Center(
                  child: EmptyStatusAnimation(
                    title: LocaleKeys.empty_no_news.tr(),
                  ),
                );
              }
              return ListView.builder(
                padding: EdgeInsets.only(top: 24.0, left: 16.0, right: 16.0),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return NewsCard(post: data[index]);
                },
              );
            },
            error: (error, _) => Center(
              child: ErrorStatusAnimation(errorMessage: "Error: $error"),
            ),
            loading: () => LoadingNewsCards(),
          );
        },
      ),
    );
  }
}
