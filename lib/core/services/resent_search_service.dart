import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchService {
  static const _key = "recent_searches";
  static const _maxItems = 10;

  /// جلب الريسنت
  Future<List<String>> getRecentSearches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  /// إضافة بحث جديد
  Future<void> addSearch(String query) async {
    if (query.trim().isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    list.remove(query); // منع التكرار
    list.insert(0, query); // الأحدث أولاً

    if (list.length > _maxItems) {
      list.removeLast(); // حد أقصى
    }

    await prefs.setStringList(_key, list);
  }

  /// حذف عنصر
  Future<void> removeSearch(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];

    list.remove(query);
    await prefs.setStringList(_key, list);
  }

  /// مسح الكل
  Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
