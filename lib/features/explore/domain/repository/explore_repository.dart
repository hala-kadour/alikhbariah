import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/explore/data/models/category/category_model.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExploreRepository {
  Future<Either<Failure, List<CategoryModel>>> getActiveCategories();
  Future<Either<Failure, List<PostModel>>> getPostsByCategoryId(String? id);
  Future<Either<Failure, List<TagModel>>> getPopularTags();
  Future<Either<Failure, List<PostModel>>> getPostsByTagId(String id);
  Future<Either<Failure, List<PostModel>>> getSearchedPosts(
    String? searchQuery,
  );
}
