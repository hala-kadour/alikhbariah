import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/breaking-news/breaking_news_model.dart';
import '../models/post/post_model.dart';
import '../models/tag/tag_model.dart';
import '../models/video/video_category_model.dart';
import '../models/video/video_model.dart';

abstract class HomeSupabaseDataSource {
  Stream<List<BreakingNewsModel>> getNewsBar();
  Stream<List<PostModel>> getBreakingPosts();
  Stream<List<PostModel>> getFeaturedPosts();
  Future<List<PostModel>> getMostReadedPosts();
  Future<List<PostModel>> getLatestPosts();
  Future<List<TagModel>> getTagsByPostId(String? id);
  Future<List<PostModel>> getRelatedPostsByPostId(String? id);
  Future<List<VideoCategoryModel>> getVideosCategories(String type);
  Future<List<VideoModel>> getVideos(String categoryId);
}

class HomeSupabaseDataSourceImpl implements HomeSupabaseDataSource {
  final SupabaseClient _client;
  HomeSupabaseDataSourceImpl(this._client);

  final String _breakingNews = 'breaking_news';
  final String _postTable = 'posts';
  final String _postTagsTabel = 'post_tags';
  final String _tagTable = 'tags';
  final String _videoCategoriesTable = 'video_categories';
  final String _videos = "videos";

  // ==============================
  // Breaking News
  // ==============================

  @override
  Stream<List<BreakingNewsModel>> getNewsBar() {
    return _client
        .from(_breakingNews)
        .stream(primaryKey: ['id'])
        .eq('is_active', true)
        .map(
          (data) => data
              .map<BreakingNewsModel>((e) => BreakingNewsModel.fromJson(e))
              .toList(),
        );
  }

  @override
  Stream<List<PostModel>> getBreakingPosts() {
    return _client
        .from(_postTable)
        .stream(primaryKey: ['id'])
        .eq('is_breaking', true)
        .order('published_at', ascending: false)
        .map(
          (data) => data.map<PostModel>((e) => PostModel.fromJson(e)).toList(),
        );
  }

  // ==============================
  // Featured News
  // ==============================
  @override
  Stream<List<PostModel>> getFeaturedPosts() {
    return _client
        .from(_postTable)
        .stream(primaryKey: ['id'])
        .eq('is_featured', true)
        .order('published_at', ascending: false)
        .map(
          (data) => data.map<PostModel>((e) => PostModel.fromJson(e)).toList(),
        );
  }

  // ==============================
  // Latest Posts
  // ==============================

  @override
  Future<List<PostModel>> getLatestPosts() async {
    final response = await _client
        .from(_postTable)
        .select()
        .eq('status', 'published')
        .order('published_at', ascending: false)
        .limit(10);

    return response.map<PostModel>((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<List<PostModel>> getMostReadedPosts() async {
    final response = await _client
        .from(_postTable)
        .select()
        .eq('status', 'published')
        .order('views_count', ascending: false);
    return response.map<PostModel>((e) => PostModel.fromJson(e)).toList();
  }

  // ==============================
  // Video Category
  // ==============================
  @override
  Future<List<VideoCategoryModel>> getVideosCategories(String type) async {
    final response = await _client
        .from(_videoCategoriesTable)
        .select('*')
        .eq('type', type)
        .order('name');
    return response
        .map<VideoCategoryModel>((e) => VideoCategoryModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<VideoModel>> getVideos(String categoryId) async {
    final response = await _client
        .from(_videos)
        .select()
        .eq('category_id', categoryId)
        .order('created_at', ascending: false);
    return response.map<VideoModel>((e) => VideoModel.fromJson(e)).toList();
  }

  // ==============================
  // Related Posts
  // ==============================
  @override
  Future<List<PostModel>> getRelatedPostsByPostId(String? id) async {
    if (id == null) return [];

    try {
      // استدعاء الـ Database Function التي أنشأناها (RPC)
      final List<dynamic> response = await _client.rpc(
        'get_related_posts', // اسم الفنكشن في SQL
        params: {'current_post_id': id, 'limit_count': 10},
      );

      // تحويل النتيجة مباشرة لموديل
      return response.map<PostModel>((e) => PostModel.fromJson(e)).toList();
    } catch (e) {
      log('Error in RPC get_related_posts: $e');
      return [];
    }
  }

  // ==============================
  // Tags By Post
  // ==============================
  @override
  Future<List<TagModel>> getTagsByPostId(String? id) async {
    if (id == null) return [];

    final response = await _client
        .from(_postTagsTabel)
        .select('$_tagTable(*)')
        .eq('post_id', id);

    return response
        .map<TagModel>((e) => TagModel.fromJson(e[_tagTable]))
        .toList();
  }
}
