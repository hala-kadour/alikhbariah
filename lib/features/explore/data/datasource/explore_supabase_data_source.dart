import 'package:alikhbariah/features/explore/data/models/category/category_model.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ExploreSupabaseDataSource {
  Future<List<CategoryModel>> getActiveCategories();
  Future<List<PostModel>> getPostsByCategoryId(String? id);
  Future<List<TagModel>> getPopularTags();
  Future<List<PostModel>> getPostsByTagId(String id);
  Future<List<PostModel>> getSearchedPosts(String? searchQuery);
}

class ExploreSupabaseDataSourceImpl implements ExploreSupabaseDataSource {
  final SupabaseClient _client;
  final String _postTable = 'posts';
  final String _tagTable = 'tags';
  final String _categoryTable = 'categories';
  final String _postTagsTabel = 'post_tags';

  ExploreSupabaseDataSourceImpl(this._client);

  @override
  Future<List<CategoryModel>> getActiveCategories() async {
    final response = await _client
        .from(_categoryTable)
        .select()
        .eq('is_active', true)
        .order('name');
    return response.map((e) => CategoryModel.fromJson(e)).toList();
  }

  @override
  Future<List<TagModel>> getPopularTags() async {
    final response = await _client.from(_postTagsTabel).select('$_tagTable(*)');

    return response
        .map<TagModel>((e) => TagModel.fromJson(e[_tagTable]))
        .toList();
  }

  @override
  Future<List<PostModel>> getPostsByTagId(String id) async {
    final response = await _client
        .from(_postTagsTabel)
        .select('$_postTable(*)')
        .eq('tag_id', id);

    return response
        .map<PostModel>((e) => PostModel.fromJson(e[_postTable]))
        .toList();
  }

  @override
  Future<List<PostModel>> getSearchedPosts(String? searchQuery) async {
    var query = _client.from(_postTable).select().eq('status', 'published');

    if (searchQuery != null && searchQuery.isNotEmpty) {
      query = query.or(
        'title.ilike.%$searchQuery%,summary.ilike.%$searchQuery%,content.ilike.%$searchQuery%,location.ilike.%$searchQuery%',
      );
    }

    final response = await query.order('published_at', ascending: false);

    return response.map<PostModel>((e) => PostModel.fromJson(e)).toList();
  }

  @override
  Future<List<PostModel>> getPostsByCategoryId(String? id) async {
    var query = _client.from(_postTable).select();

    if (id != null) {
      query = query.eq('category_id', id);
    }

    final response = await query
        .eq('status', 'published')
        .order('published_at', ascending: false);

    return response.map<PostModel>((e) => PostModel.fromJson(e)).toList();
  }
}
