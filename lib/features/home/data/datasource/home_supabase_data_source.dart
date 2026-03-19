import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/post/post_model.dart';
import '../models/tag/tag_model.dart';

abstract class HomeSupabaseDataSource {
  Stream<List<PostModel>> getFeaturedPosts();
  Stream<List<PostModel>> getBreakingPosts();
  Future<List<PostModel>> getLatestPosts();
  Future<List<TagModel>> getTagsByPostId(String? id);
  Future<List<PostModel>> getRelatedPostsByPostId(String? id);
}

class HomeSupabaseDataSourceImpl implements HomeSupabaseDataSource {
  final SupabaseClient _client;
  HomeSupabaseDataSourceImpl(this._client);

  final String _postTable = 'posts';
  final String _postTagsTabel = 'post_tags';
  final String _tagTable = 'tags';

  // ==============================
  // Breaking News
  // ==============================
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
