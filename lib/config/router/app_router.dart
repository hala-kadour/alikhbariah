import 'package:alikhbariah/features/bookmark/presentation/pages/collection_posts_page.dart';
import 'package:alikhbariah/features/bookmark/presentation/pages/saved_post_details_page.dart';
import 'package:alikhbariah/features/explore/presentation/pages/actaul_search_page.dart';
import 'package:alikhbariah/features/explore/presentation/pages/search_page.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:alikhbariah/features/home/data/models/video/video_category_model.dart';
import 'package:alikhbariah/features/home/presentation/pages/breaking_news_page.dart';
import 'package:alikhbariah/features/home/presentation/pages/featured_posts_page.dart';
import 'package:alikhbariah/features/home/presentation/pages/latest_posts_page.dart';
import 'package:alikhbariah/features/home/presentation/pages/most_readed_posts_page.dart';
import 'package:alikhbariah/features/home/presentation/pages/video_player_page.dart';
import 'package:alikhbariah/features/home/presentation/pages/videos_categories_page.dart';
import 'package:alikhbariah/features/home/presentation/pages/videos_page.dart';
import 'package:alikhbariah/features/intro/pages/splash_page.dart';
import 'package:alikhbariah/features/intro/provider/intro_provider.dart';
import 'package:alikhbariah/features/notifications/presentation/pages/notification_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/services/navigation_service.dart';
import '../../features/bookmark/domain/entity/locale_post.dart';
import '../../features/bookmark/presentation/pages/bookmark_page.dart';
import '../../features/explore/presentation/pages/explore_page.dart';
import '../../features/explore/presentation/pages/tag_search_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/post_details_page.dart';
import '../../features/intro/pages/on_board_page.dart';
import '../../features/mobile_root_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import 'app_route_config.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final firstLaunch = ref.watch(isFirstProvider);
  return GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final isFirst = firstLaunch.when(
        data: (value) => value,
        loading: () => null,
        error: (_, _) => false,
      );
      final isSplash = state.matchedLocation == '/';

      if (isFirst == null) {
        return isSplash ? null : '/';
      }

      if (isFirst && isSplash) {
        return '/onboarding';
      }

      if (!isFirst && isSplash) {
        return '/home';
      }

      return null;
    },
    routes: [
      // MAIN MOBILE APP PAGES
      GoRoute(
        name: AppRouteConfig.splash,
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      // ON BOARD PAGE
      GoRoute(
        name: AppRouteConfig.onboarding,
        path: '/onboarding',
        builder: (context, state) => const OnBoardingPage(),
      ),
      GoRoute(
        name: AppRouteConfig.postDetails,
        path: '/post-details',
        builder: (context, state) =>
            PostDetailsPage(post: state.extra as PostModel),
      ),
      GoRoute(
        name: AppRouteConfig.notifications,
        path: '/notifications',
        builder: (context, state) => NotificationPage(),
      ),
      // MOBILE ROOT PAGE
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => MobileRootPage(shell: shell),
        branches: [
          // Home Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.home,
                path: '/home',
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    name: AppRouteConfig.breakingNews,
                    path: 'breaking-news',
                    builder: (context, state) => BreakingNewsPage(),
                  ),
                  GoRoute(
                    name: AppRouteConfig.latestPosts,
                    path: 'latest-posts',
                    builder: (context, state) => LatestPostsPage(),
                  ),
                  GoRoute(
                    name: AppRouteConfig.featuredPosts,
                    path: 'featured-posts',
                    builder: (context, state) => FeaturedPostsPage(),
                  ),
                  GoRoute(
                    name: AppRouteConfig.mostReadedPosts,
                    path: 'most-readed-posts',
                    builder: (context, state) => MostReadedPostsPage(),
                  ),
                  GoRoute(
                    name: AppRouteConfig.videosCategories,
                    path: 'videos-categories',
                    builder: (context, state) =>
                        VideosCategoriesPage(type: state.extra as String),
                  ),
                  GoRoute(
                    name: AppRouteConfig.videos,
                    path: 'videos',
                    builder: (context, state) =>
                        VideosPage(category: state.extra as VideoCategoryModel),
                    routes: [
                      GoRoute(
                        name: AppRouteConfig.videoPlayer,
                        path: 'video-player',
                        builder: (context, state) =>
                            VideoPlayerPage(videoId: state.extra as String),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Explore Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.explore,
                path: '/explore',
                builder: (context, state) => const ExplorePage(),
                routes: [
                  GoRoute(
                    name: AppRouteConfig.search,
                    path: 'search',
                    builder: (context, state) => const SearchPage(),
                    routes: [
                      GoRoute(
                        name: AppRouteConfig.actaulSearch,
                        path: 'actaul-search',
                        builder: (context, state) => const ActaulSearchPage(),
                      ),
                      GoRoute(
                        name: AppRouteConfig.tagSearch,
                        path: 'tag-search',
                        builder: (context, state) =>
                            TagSearchPage(tag: state.extra as TagModel),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Bookmark Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.bookmark,
                path: '/bookmark',
                builder: (context, state) => const BookmarkPage(),
                routes: [
                  GoRoute(
                    name: AppRouteConfig.collectionPosts,
                    path: 'collection-posts',
                    builder: (context, state) => CollectionPostsPage(
                      collection: state.extra as LocalCollection,
                    ),
                    routes: [
                      GoRoute(
                        name: AppRouteConfig.savedPostDetails,
                        path: 'saved-post-details',
                        builder: (context, state) => SavedPostDetailsPage(
                          post: state.extra as LocalPost,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Settings Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.settings,
                path: '/settings',
                builder: (context, state) => const SettingsPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});
