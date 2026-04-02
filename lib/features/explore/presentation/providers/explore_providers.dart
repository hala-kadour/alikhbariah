import 'package:alikhbariah/features/explore/domain/usecases/get_active_categories_use_case.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_category_posts_use_case.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_popular_tags_use_case.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_searched_posts_use_case.dart';
import 'package:alikhbariah/features/explore/domain/usecases/get_tag_posts_use_case.dart';
import 'package:alikhbariah/injection_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActiveCategoriesUC = Provider(
  (ref) => sl<GetActiveCategoriesUseCase>(),
);

final getCategoryPostsUC = Provider((ref) => sl<GetCategoryPostsUseCase>());

final getPopularTagsUC = Provider((ref) => sl<GetPopularTagsUseCase>());

final getSearchedPostsUC = Provider((ref) => sl<GetSearchedPostsUseCase>());

final getTagPostsUC = Provider((ref) => sl<GetTagPostsUseCase>());

// فلاتر البحث
final searchTimeFilterProvider = StateProvider<String>((ref) => "all_time");
final searchCategoryFilterProvider = StateProvider<String?>(
  (ref) => null,
); // null تعني الكل
final isUrgentFilterProvider = StateProvider<bool>((ref) => false);
final isFeaturedFilterProvider = StateProvider<bool>((ref) => false);
final searchProvider = StateProvider<String?>((ref) => null);

final searchedPostsProvider = FutureProvider.autoDispose((ref) async {
  final useCase = ref.watch(getSearchedPostsUC);
  // مراقبة الفلاتر
  final timeFilter = ref.watch(searchTimeFilterProvider);
  final categoryId = ref.watch(searchCategoryFilterProvider);
  final isUrgent = ref.watch(isUrgentFilterProvider);
  final isFeatured = ref.watch(isFeaturedFilterProvider);
  final searchQuery = ref.watch(searchProvider);

  final result = await useCase.call(
    SearchFilters(
      searchQuery: searchQuery,
      timeRange: timeFilter,
      categoryId: categoryId,
      isUrgent: isUrgent,
      isFeatured: isFeatured,
    ),
  );

  return result.fold((failure) => throw failure.message, (posts) => posts);
});

final categoriesProvider = FutureProvider((ref) async {
  final useCase = ref.watch(getActiveCategoriesUC);
  final result = await useCase.call();

  return result.fold(
    (failure) => throw failure.message,
    (categoris) => categoris,
  );
});

final filteredPostsProvider = FutureProvider((ref) async {
  final categoryId = ref.watch(selectedCategoryIdProvider);
  final useCase = ref.watch(getCategoryPostsUC);
  final result = await useCase.call(categoryId);

  return result.fold((failure) => throw failure.message, (posts) => posts);
});

final selectedCategoryIdProvider = StateProvider<String?>((ref) {
  return null; // null = All
});

final popularTagsProvider = FutureProvider((ref) async {
  final useCase = ref.watch(getPopularTagsUC);
  final result = await useCase.call();

  return result.fold((failure) => throw failure.message, (tags) => tags);
});

final tagPostsProvider = FutureProvider.family((ref, String id) async {
  final useCase = ref.watch(getTagPostsUC);
  final result = await useCase.call(id);

  return result.fold((failure) => throw failure.message, (posts) => posts);
});
