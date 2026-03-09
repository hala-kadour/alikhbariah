import 'package:alikhbariah/features/home/domain/usecases/get_featured_posts_use_case.dart';
import 'package:alikhbariah/features/home/domain/usecases/get_post_tags_use_case.dart';
import 'package:alikhbariah/features/home/domain/usecases/get_related_posts_use_case.dart';
import 'package:alikhbariah/injection_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_breaking_posts_use_case.dart';
import '../../domain/usecases/get_latest_posts_use_case.dart';

final getBreakingPostsUC = Provider((ref) => sl<GetBreakingPostsUseCase>());
final getFeaturedPostsUC = Provider((ref) => sl<GetFeaturedPostsUseCase>());
final getLatestPostsUC = Provider((ref) => sl<GetLatestPostsUseCase>());
final getPostTagsUC = Provider((ref) => sl<GetPostTagsUseCase>());
final getRelatedPostsUC = Provider((ref) => sl<GetRelatedPostsUseCase>());

final breakingPostsProvider = StreamProvider((ref) {
  final useCase = ref.watch(getBreakingPostsUC);

  return useCase.call().map((either) {
    return either.fold((failure) => throw failure.message, (posts) => posts);
  });
});

final featuredPostsProvider = StreamProvider((ref) {
  final useCase = ref.watch(getFeaturedPostsUC);

  return useCase.call().map((either) {
    return either.fold((failure) => throw failure.message, (posts) => posts);
  });
});

final latestPostsProvider = FutureProvider((ref) async {
  final useCase = ref.watch(getLatestPostsUC);

  final result = await useCase.call();

  return result.fold((failure) => throw failure.message, (posts) => posts);
});

final postTagsProvider = FutureProvider.family((ref, String id) async {
  final useCase = ref.watch(getPostTagsUC);

  final result = await useCase.call(id);

  return result.fold((failure) => throw failure.message, (tags) => tags);
});

final relatedPostsProvider = FutureProvider.family((ref, String id) async {
  final useCase = ref.watch(getRelatedPostsUC);

  final result = await useCase.call(id);

  return result.fold((failure) => throw failure.message, (tags) => tags);
});
