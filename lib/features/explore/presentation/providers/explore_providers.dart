import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasource/explore_supabase_datasource.dart';

final exploreRepositoryProvider = Provider((ref) {
  return ExploreSupabaseDatasource();
});

final searchProvider = StateProvider<String?>((ref) => null);

final searchedPostsProvider = FutureProvider((ref) {
  final repo = ref.watch(exploreRepositoryProvider);
  final searchQuery = ref.watch(searchProvider);
  return repo.getSearchedPosts(searchQuery);
});

final categoriesProvider = FutureProvider((ref) {
  final homeRepository = ref.watch(exploreRepositoryProvider);
  return homeRepository.getActiveCategory();
});

final filteredPostsProvider = FutureProvider((ref) async {
  final repo = ref.watch(exploreRepositoryProvider);
  final categoryId = ref.watch(selectedCategoryIdProvider);
  return repo.getPostsByCategoryId(categoryId);
});

final selectedCategoryIdProvider = StateProvider<String?>((ref) {
  return null; // null = All
});

final popularTagsProvider = FutureProvider((ref) {
  final repo = ref.watch(exploreRepositoryProvider);
  return repo.getPopularTags();
});

final tagPostsProvider = FutureProvider.family((ref, String id) {
  final repo = ref.watch(exploreRepositoryProvider);
  return repo.getPostsByTagId(id);
});
