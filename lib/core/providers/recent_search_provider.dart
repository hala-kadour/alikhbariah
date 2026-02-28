import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/resent_search_service.dart';

final recentSearchProvider =
    NotifierProvider<RecentSearchNotifier, List<String>>(
      RecentSearchNotifier.new,
    );

class RecentSearchNotifier extends Notifier<List<String>> {
  final _service = RecentSearchService();

  @override
  List<String> build() {
    _load();
    return [];
  }

  Future<void> _load() async {
    state = await _service.getRecentSearches();
  }

  Future<void> addSearch(String query) async {
    await _service.addSearch(query);
    state = await _service.getRecentSearches();
  }

  Future<void> removeSearch(String query) async {
    await _service.removeSearch(query);
    state = await _service.getRecentSearches();
  }

  Future<void> clearAll() async {
    await _service.clearAll();
    state = [];
  }
}
