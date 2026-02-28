import 'package:alikhbariah/features/bookmark/presentation/pages/collection_posts_page.dart';
import 'package:alikhbariah/features/bookmark/presentation/pages/saved_post_details_page.dart';
import 'package:alikhbariah/features/explore/presentation/pages/actaul_search_page.dart';
import 'package:alikhbariah/features/explore/presentation/pages/search_page.dart';
import 'package:alikhbariah/features/home/domain/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/models/tag/tag_model.dart';
import 'package:alikhbariah/features/intro/pages/splash_page.dart';
import 'package:alikhbariah/features/intro/provider/intro_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/bookmark/domain/models/locale_post.dart';
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
