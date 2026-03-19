import 'package:alikhbariah/config/constant/assets_path.dart';
import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/core/widgets/layout/navbar/main_back_app_bar.dart';
import 'package:alikhbariah/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/theme/app_icons.dart';
import '../../domain/entity/locale_post.dart';
import '../providers/bookmark_provider.dart';
import '../widgets/saved_post_tile.dart';

class CollectionPostsPage extends ConsumerStatefulWidget {
  final LocalCollection collection;

  const CollectionPostsPage({super.key, required this.collection});

  @override
  ConsumerState<CollectionPostsPage> createState() =>
      _CollectionPostsPageState();
}

class _CollectionPostsPageState extends ConsumerState<CollectionPostsPage> {
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    /// 🔥 نراقب الحالة من Riverpod
    final bookmarkState = ref.watch(bookmarkNotifierProvider);

    /// 🔥 نجيب الكولكشن الحالية من الحالة وليس من widget
    final collection = bookmarkState.firstWhere(
      (c) => c.id == widget.collection.id,
      orElse: () => widget.collection,
    );

    final filteredPosts = collection.posts.where((post) {
      return post.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: MainBackAppBar(
        title: collection.name,
        action: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                spacing: 8.0,
                children: [Icon(AppIcons.editSquareLight), Text("Edit".i18n)],
              ),
            ),
            PopupMenuItem(
              onTap: () => _removeCollection(collection.id),
              child: Row(
                spacing: 8.0,
                children: [
                  Icon(AppIcons.deleteLight, color: AppColors.errorDefault),
                  Text(
                    "Delete".i18n,
                    style: TextStyle(color: AppColors.errorDefault),
                  ),
                ],
              ),
            ),
          ],
          icon: Icon(AppIcons.moreCircleLight),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: "Search saved news".i18n,
                prefixIcon: const Icon(AppIcons.searchLight),
              ),
            ),
          ),
          Expanded(
            child: filteredPosts.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    itemCount: filteredPosts.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final post = filteredPosts[index];
                      return SavedPostTile(
                        post: post,
                        onDelete: () =>
                            _removePost(post.remoteId, collection.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AnimationsPath.noData, width: 200),
          const SizedBox(height: 16),
          Text(
            "No saved news found".i18n,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  void _removePost(String remoteId, int collectionId) {
    ref
        .read(bookmarkNotifierProvider.notifier)
        .removePost(remoteId: remoteId, collectionId: collectionId);
  }

  void _removeCollection(int collectionId) {
    ref.read(bookmarkNotifierProvider.notifier).deleteCollection(collectionId);
    context.pop();
  }
}
