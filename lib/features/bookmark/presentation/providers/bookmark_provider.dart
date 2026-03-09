import 'dart:io';

import 'package:alikhbariah/features/bookmark/data/datasource/bookmark_locale_data_source.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/injection_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helper/image_downloader.dart';
import '../../../../core/services/object_box_service.dart';
import '../../domain/entity/locale_post.dart';

final objectBoxProvider = Provider<ObjectBoxService>(
  (ref) => sl<ObjectBoxService>(),
);

final bookmarkRepositoryProvider = Provider((ref) {
  final service = ref.watch(objectBoxProvider);
  return BookmarkLocalDataSource(service);
});

// بروفايدر لفحص هل البوست محفوظ أم لا
final isSavedProvider = Provider.family<bool, String>((ref, remoteId) {
  final dataSource = ref.watch(bookmarkRepositoryProvider);
  return dataSource.isPostSaved(remoteId);
});

final bookmarkNotifierProvider =
    StateNotifierProvider<BookmarkNotifier, List<LocalCollection>>((ref) {
      return BookmarkNotifier(ref.watch(bookmarkRepositoryProvider));
    });

class BookmarkNotifier extends StateNotifier<List<LocalCollection>> {
  final BookmarkLocalDataSource _dataSource;

  BookmarkNotifier(this._dataSource) : super([]) {
    refresh();
  }

  void refresh() {
    state = _dataSource.getAllCollections();
  }

  // إنشاء كولكشن جديدة
  void createCollection(String name) {
    _dataSource.saveCollection(LocalCollection(name: name));
    refresh();
  }

  // تعديل اسم كولكشن
  void renameCollection(int id, String newName) {
    final collection = state.firstWhere((c) => c.id == id);
    collection.name = newName;
    _dataSource.saveCollection(collection);
    refresh();
  }

  // حذف كولكشن
  void deleteCollection(int id) {
    _dataSource.deleteCollection(id);
    refresh();
  }

  // 1️⃣ تابع الحفظ المخصص
  Future<void> savePost({
    required PostModel post,
    required int collectionId,
  }) async {
    // تحميل الصورة يدوياً لضمان الـ Offline
    final localPath = await ImageDownloader.downloadAndSaveImage(
      post.imageUrl ?? '',
      post.id,
    );

    final localPost = LocalPost(
      remoteId: post.id,
      title: post.title,
      summary: post.summary ?? '',
      content: post.content,
      imageUrl: post.imageUrl,
      localImagePath: localPath, // حفظ المسار المحلي
      savedAt: DateTime.now(),
    );

    await _dataSource.addPostToCollection(localPost, collectionId);
    refresh();
  }

  // 2️⃣ تابع إلغاء الحفظ المخصص (حذف من كل المجموعات)
  Future<void> unsavePost(String remoteId) async {
    final post = _dataSource.getPostById(remoteId);

    if (post != null) {
      for (final collection in post.collections.toList()) {
        _dataSource.removePostFromCollection(post.id, collection.id);
      }

      if (post.localImagePath != null) {
        final file = File(post.localImagePath!);
        if (await file.exists()) await file.delete();
      }

      refresh();
    }
  }

  Future<void> removePostFromCollection(
    String remoteId,
    int collectionId,
  ) async {
    final post = _dataSource.getPostById(remoteId);

    if (post != null) {
      _dataSource.removePostFromCollection(post.id, collectionId);
      if (post.collections.isEmpty && post.localImagePath != null) {
        final file = File(post.localImagePath!);
        if (await file.exists()) await file.delete();
      }

      refresh();
    }
  }

  // 3️⃣ التابع المنظم (The Orchestrator)
  Future<void> toggleBookmark({
    required PostModel post,
    int? collectionId, // اختياري في حال كان التبديل هو إلغاء حفظ
  }) async {
    final isAlreadySaved = _dataSource.isPostSaved(post.id);

    if (isAlreadySaved) {
      await unsavePost(post.id);
    } else {
      if (collectionId != null) {
        await savePost(post: post, collectionId: collectionId);
      }
    }
  }
}
