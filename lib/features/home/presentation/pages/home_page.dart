import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/features/home/presentation/widgets/latest_posts_view_cards.dart';
import 'package:alikhbariah/features/home/presentation/widgets/section_title.dart';
import 'package:alikhbariah/features/home/presentation/widgets/video_categories_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/breaking_news_page_view.dart';
import '../widgets/home_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap.h8,
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  SectionTitle(
                    title: LocaleKeys.breaking_news.tr(),
                    onPressed: () =>
                        context.pushNamed(AppRouteConfig.breakingNews),
                  ),
                  BreakingNewsPageView(),
                  Gap.h16,
                  SectionTitle(
                    title: LocaleKeys.latest_news.tr(),
                    onPressed: () =>
                        context.pushNamed(AppRouteConfig.latestPosts),
                  ),
                  LatestPostsViewCards(),
                  SectionTitle(
                    title: LocaleKeys.news_videos.tr(),
                    onPressed: () => context.pushNamed(
                      AppRouteConfig.videosCategories,
                      extra: "news_video",
                    ),
                  ),
                  VideoCategoriesView(type: "news_video"),
                  SectionTitle(
                    title: LocaleKeys.programs.tr(),
                    onPressed: () => context.pushNamed(
                      AppRouteConfig.videosCategories,
                      extra: "program",
                    ),
                  ),
                  VideoCategoriesView(type: "program"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
