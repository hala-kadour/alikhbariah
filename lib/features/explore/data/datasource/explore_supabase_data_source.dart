import 'package:alikhbariah/features/explore/data/models/category/category_model.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ExploreSupabaseDataSource {
  Future<List<CategoryModel>> getActiveCategories();
  Future<List<PostModel>> getPostsByCategoryId(String? id);
  Future<List<TagModel>> getPopularTags();
  Future<List<PostModel>> getPostsByTagId(String id);
  Future<List<PostModel>> getSearchedPosts({
    String? searchQuery,
    String? timeRange,
    String? categoryId,
    bool? isUrgent,
    bool? isFeatured,
  });
}

class ExploreSupabaseDataSourceImpl implements ExploreSupabaseDataSource {
  final SupabaseClient _client;
  final String _postTable = 'posts';
  //final String _tagTable = 'tags';
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
    final response = await _client.rpc('get_popular_tags');

    return (response as List)
        .map<TagModel>((e) => TagModel.fromJson(e))
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
  Future<List<PostModel>> getSearchedPosts({
    String? searchQuery,
    String? timeRange,
    String? categoryId,
    bool? isUrgent,
    bool? isFeatured,
  }) async {
    // 1. الاستعلام الأساسي للأخبار المنشورة فقط
    var query = _client.from(_postTable).select().eq('status', 'published');

    // 2. فلترة البحث النصي (Title, Summary, Content, Location)
    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      query = query.or(
        'title.ilike.%$searchQuery%,summary.ilike.%$searchQuery%,content.ilike.%$searchQuery%,location.ilike.%$searchQuery%',
      );
    }

    // 3. فلترة الصنف (Category)
    if (categoryId != null) {
      query = query.eq('category_id', categoryId);
    }

    // 4. فلترة الأخبار العاجلة أو المميزة
    if (isUrgent == true) {
      query = query.eq('is_breaking', true);
    }
    if (isFeatured == true) {
      query = query.eq('is_featured', true);
    }

    // 5. فلترة الزمن (Time Range)
    if (timeRange != null && timeRange != "all_time") {
      final DateTime now = DateTime.now();
      DateTime filterDate;

      if (timeRange == "today") {
        filterDate = DateTime(now.year, now.month, now.day); // بداية اليوم
      } else if (timeRange == "week") {
        filterDate = now.subtract(const Duration(days: 7)); // منذ 7 أيام
      } else {
        filterDate = DateTime(1970); // افتراضي قديم جداً
      }

      // gte تعني Greater Than or Equal (أكبر من أو يساوي التاريخ المحدد)
      query = query.gte('published_at', filterDate.toIso8601String());
    }

    // 6. الترتيب من الأحدث للأقدم
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
