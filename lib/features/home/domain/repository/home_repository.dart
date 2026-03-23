import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/video/video_category_model.dart';
import '../../data/models/video/video_model.dart';

abstract class HomeRepository {
  Stream<Either<Failure, List<PostModel>>> getFeaturedPosts();
  Stream<Either<Failure, List<PostModel>>> getBreakingPosts();
  Future<Either<Failure, List<PostModel>>> getLatestPosts();
  Future<Either<Failure, List<TagModel>>> getTagsByPostId(String? id);
  Future<Either<Failure, List<PostModel>>> getRelatedPostsByPostId(String? id);
  Future<Either<Failure, List<VideoCategoryModel>>> getVideosCategories(
    String type,
  );
  Future<Either<Failure, List<VideoModel>>> getVideos(String categoryId);
}
