import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/theme/app_icons.dart';
import '../providers/bookmark_provider.dart';

class BookmarkIconButton extends ConsumerWidget {
  final PostModel post;
  final bool isLighter;

  const BookmarkIconButton({
    super.key,
    required this.post,
    this.isLighter = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSaved = ref.watch(isSavedProvider(post.id));

    return IconButton(
      icon: Icon(
        isSaved ? AppIcons.bookmarkBold : AppIcons.bookmarkLight,
        color: isSaved
            ? Theme.of(context).primaryColor
            : isLighter
            ? Theme.of(context).dividerColor
            : Theme.of(context).disabledColor,
        size: 24,
      ),
      onPressed: () async {
        HapticFeedback.lightImpact();
        if (isSaved) {
          await _showConfirmUnsaveDialog(context, ref);
        } else {
          _openSelectCollectionSheet(context, ref, post);
        }
      },
    );
  }

  Future<void> _showConfirmUnsaveDialog(
    BuildContext context,
    WidgetRef ref,
  ) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.cancel.tr()),
        content: Text(LocaleKeys.delete_item_confirm.tr(), textAlign: .center),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(bookmarkNotifierProvider.notifier)
                  .removePost(remoteId: post.id);
              Navigator.pop(context);
              ref.invalidate(isSavedProvider(post.id));
            },
            child: Text(
              LocaleKeys.delete.tr(),
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  void _openSelectCollectionSheet(
    BuildContext context,
    WidgetRef ref,
    PostModel post,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final collections = ref.watch(bookmarkNotifierProvider);
            return Container(
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: .start,
                children: [
                  Text(
                    LocaleKeys.save_in_collection.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Gap.h16,
                  ...collections.map(
                    (collection) => InkWell(
                      child: ListTile(
                        leading: const Icon(AppIcons.folderLight),
                        title: Text(
                          collection.name.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        onTap: () async {
                          await ref
                              .read(bookmarkNotifierProvider.notifier)
                              .savePost(
                                post: post,
                                collectionId: collection.id,
                              );
                          if (!context.mounted) return;
                          context.pop();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            ref.invalidate(isSavedProvider(post.id));
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
