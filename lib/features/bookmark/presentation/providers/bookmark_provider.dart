import 'dart:io';

import 'package:alikhbariah/features/bookmark/domain/usecases/add_post_to_collection_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/delete_collection_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/get_all_collections_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/get_collection_posts_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/get_post_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/is_post_saved_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/remove_post_from_collection_use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/usecases/save_collection_use_case.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/injection_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helper/image_downloader.dart';
import '../../domain/entity/locale_post.dart';

final addPostToCollectionUC = Provider(
  (ref) => sl<AddPostToCollectionUseCase>(),
);
final deleteCollectionUC = Provider((ref) => sl<DeleteCollectionUseCase>());
final getAllCollectionUC = Provider((ref) => sl<GetAllCollectionsUseCase>());
final getCollectionPostsUc = Provider((ref) => sl<GetCollectionPostsUseCase>());
final getPostUC = Provider((ref) => sl<GetPostUseCase>());
final isPostSavedUC = Provider((ref) => sl<IsPostSavedUseCase>());
final removePostFromCollectionUC = Provider(
  (ref) => sl<RemovePostFromCollectionUseCase>(),
);
final saveCollectionUC = Provider((ref) => sl<SaveCollectionUseCase>());

final isSavedProvider = Provider.family<bool, String>((ref, remoteId) {
  final useCase = ref.watch(isPostSavedUC);
  final result = useCase.call(remoteId);
  return result.fold((failure) => throw failure.message, (isSaved) => isSaved);
});

final bookmarkNotifierProvider =
    StateNotifierProvider<BookmarkNotifier, List<LocalCollection>>((ref) {
      return BookmarkNotifier(ref);
    });

class BookmarkNotifier extends StateNotifier<List<LocalCollection>> {
  final Ref _ref;

  BookmarkNotifier(this._ref) : super([]) {
    refresh();
  }

  void refresh() {
    final result = _ref.read(getAllCollectionUC).call();
    result.fold((failure) => null, (collections) => state = collections);
  }

  void saveCollection(String name) {
    _ref.read(saveCollectionUC).call(LocalCollection(name: name));
    refresh();
  }

  void deleteCollection(int id) {
    _ref.read(deleteCollectionUC).call(id);
    refresh();
  }

  void updateCollectionName(LocalCollection collection, String newName) {
    collection.name = newName;
    _ref.read(saveCollectionUC).call(collection);
    refresh();
  }

  Future<void> savePost({
    required PostModel post,
    required int collectionId,
  }) async {
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
      localImagePath: localPath,
      savedAt: DateTime.now(),
    );

    final result = await _ref
        .read(addPostToCollectionUC)
        .call(
          AddPostToCollectionParam(post: localPost, collectionId: collectionId),
        );
    result.fold((l) => null, (r) => refresh());
  }

  Future<void> removePost({required String remoteId, int? collectionId}) async {
    final postResult = _ref.read(getPostUC).call(remoteId);

    postResult.fold((l) => null, (post) async {
      if (post != null) {
        final result = _ref
            .read(removePostFromCollectionUC)
            .call(
              RemovePostFormCollectioParam(
                postId: post.id,
                collectionId: collectionId ?? post.collections.first.id,
              ),
            );

        result.fold((l) => null, (r) async {
          if (post.collections.length <= 1 && post.localImagePath != null) {
            final file = File(post.localImagePath!);
            if (await file.exists()) await file.delete();
          }
          refresh();
        });
      }
    });
  }

  Future<void> toggleBookmark({
    required PostModel post,
    int? collectionId,
  }) async {
    final isSavedResult = _ref.read(isPostSavedUC).call(post.id);

    isSavedResult.fold((l) => null, (isSaved) async {
      if (isSaved) {
        if (collectionId != null) {
          await removePost(remoteId: post.id, collectionId: collectionId);
        }
      } else {
        if (collectionId != null) {
          await savePost(post: post, collectionId: collectionId);
        }
      }
    });
  }
}
