import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/home_supabase_datasource.dart';

final homeRepositoryProvider = Provider((ref) {
  return HomeSupabaseDatasource();
});

final breakingPostsProvider = StreamProvider((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.getBreakingPosts();
});

final featuredPostsProvider = StreamProvider((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.getFeaturedPosts();
});

final latestPostsProvider = FutureProvider((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.getLatestPosts();
});

final postTagsProvider = FutureProvider.family((ref, String id) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.getTagsByPostId(id);
});

final relatedPostsProvider = FutureProvider.family((ref, String id) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return homeRepository.getRelatedPostsByPostId(id);
});
