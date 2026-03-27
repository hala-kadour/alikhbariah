import 'package:alikhbariah/core/error/error_handling_manager.dart';
import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/home/data/datasource/home_supabase_data_source.dart';
import 'package:alikhbariah/features/home/data/models/breaking-news/breaking_news_model.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:alikhbariah/features/home/data/models/video/video_category_model.dart';
import 'package:alikhbariah/features/home/data/models/video/video_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl with ErrorHandlingManager implements HomeRepository {
  final HomeSupabaseDataSource _homeSupabaseDatasource;

  HomeRepositoryImpl(this._homeSupabaseDatasource);

  @override
  Stream<Either<Failure, List<BreakingNewsModel>>> getNewsBar() {
    return safeStream(_homeSupabaseDatasource.getNewsBar());
  }

  @override
  Stream<Either<Failure, List<PostModel>>> getBreakingPosts() {
    return safeStream(_homeSupabaseDatasource.getBreakingPosts());
  }

  @override
  Stream<Either<Failure, List<PostModel>>> getFeaturedPosts() {
    return safeStream(_homeSupabaseDatasource.getFeaturedPosts());
  }

  @override
  Future<Either<Failure, List<PostModel>>> getMostReadedPosts() {
    return safeCall(() => _homeSupabaseDatasource.getMostReadedPosts());
  }

  @override
  Future<Either<Failure, List<PostModel>>> getLatestPosts() {
    return safeCall(() => _homeSupabaseDatasource.getLatestPosts());
  }

  @override
  Future<Either<Failure, List<PostModel>>> getRelatedPostsByPostId(String? id) {
    return safeCall(() => _homeSupabaseDatasource.getRelatedPostsByPostId(id));
  }

  @override
  Future<Either<Failure, List<TagModel>>> getTagsByPostId(String? id) {
    return safeCall(() => _homeSupabaseDatasource.getTagsByPostId(id));
  }

  @override
  Future<Either<Failure, List<VideoModel>>> getVideos(String categoryId) {
    return safeCall(() => _homeSupabaseDatasource.getVideos(categoryId));
  }

  @override
  Future<Either<Failure, List<VideoCategoryModel>>> getVideosCategories(
    String type,
  ) {
    return safeCall(() => _homeSupabaseDatasource.getVideosCategories(type));
  }
}
