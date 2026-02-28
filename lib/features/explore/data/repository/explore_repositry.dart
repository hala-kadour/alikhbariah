import 'package:alikhbariah/features/explore/domain/models/category/category_model.dart';
import 'package:alikhbariah/features/home/domain/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/models/tag/tag_model.dart';

abstract class ExploreRepositry {
  Future<List<CategoryModel>> getActiveCategory();
  Future<List<PostModel>> getPostsByCategoryId(String? id);
  Future<List<TagModel>> getPopularTags();
  Future<List<PostModel>> getPostsByTagId(String id);
  Future<List<PostModel>> getSearchedPosts(String? searchQuery);
}
