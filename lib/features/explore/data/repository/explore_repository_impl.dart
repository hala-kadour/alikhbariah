import 'package:alikhbariah/core/error/error_handling_manager.dart';
import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/explore/data/datasource/explore_supabase_data_source.dart';
import 'package:alikhbariah/features/explore/data/models/category/category_model.dart';
import 'package:alikhbariah/features/explore/domain/repository/explore_repository.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:dartz/dartz.dart';

class ExploreRepositoryImpl
    with ErrorHandlingManager
    implements ExploreRepository {
  final ExploreSupabaseDataSource _exploreSupabaseDataSource;

  ExploreRepositoryImpl(this._exploreSupabaseDataSource);
  @override
  Future<Either<Failure, List<CategoryModel>>> getActiveCategories() {
    return safeCall(() => _exploreSupabaseDataSource.getActiveCategories());
  }

  @override
  Future<Either<Failure, List<TagModel>>> getPopularTags() {
    return safeCall(() => _exploreSupabaseDataSource.getPopularTags());
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPostsByCategoryId(String? id) {
    return safeCall(() => _exploreSupabaseDataSource.getPostsByCategoryId(id));
  }

  @override
  Future<Either<Failure, List<PostModel>>> getPostsByTagId(String id) {
    return safeCall(() => _exploreSupabaseDataSource.getPostsByTagId(id));
  }

  @override
  Future<Either<Failure, List<PostModel>>> getSearchedPosts({
    String? searchQuery,
    String? timeRange,
    String? categoryId,
    bool? isUrgent,
    bool? isFeatured,
  }) {
    return safeCall(
      () => _exploreSupabaseDataSource.getSearchedPosts(
        searchQuery: searchQuery,
        timeRange: timeRange,
        categoryId: categoryId,
        isUrgent: isUrgent,
        isFeatured: isFeatured,
      ),
    );
  }
}
