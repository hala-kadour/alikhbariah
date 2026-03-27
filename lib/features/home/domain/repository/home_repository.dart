import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:dartz/dartz.dart';

import '../../data/models/breaking-news/breaking_news_model.dart';
import '../../data/models/video/video_category_model.dart';
import '../../data/models/video/video_model.dart';

abstract class HomeRepository {
  Stream<Either<Failure, List<BreakingNewsModel>>> getNewsBar();
  Stream<Either<Failure, List<PostModel>>> getBreakingPosts();
  Stream<Either<Failure, List<PostModel>>> getFeaturedPosts();
  Future<Either<Failure, List<PostModel>>> getMostReadedPosts();
  Future<Either<Failure, List<PostModel>>> getLatestPosts();
  Future<Either<Failure, List<TagModel>>> getTagsByPostId(String? id);
  Future<Either<Failure, List<PostModel>>> getRelatedPostsByPostId(String? id);
  Future<Either<Failure, List<VideoCategoryModel>>> getVideosCategories(
    String type,
  );
  Future<Either<Failure, List<VideoModel>>> getVideos(String categoryId);
}
