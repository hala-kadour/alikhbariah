import 'package:alikhbariah/features/home/domain/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/models/tag/tag_model.dart';

abstract class HomeRepository {
  Stream<List<PostModel>> getFeaturedPosts();
  Stream<List<PostModel>> getBreakingPosts();
  Future<List<PostModel>> getLatestPosts();
  Future<List<TagModel>> getTagsByPostId(String? id);
  Future<List<PostModel>> getRelatedPostsByPostId(String? id);
}
