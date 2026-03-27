import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../domain/entity/locale_post.dart';
import '../providers/bookmark_provider.dart';

class RenameCollectionDialog extends ConsumerStatefulWidget {
  final LocalCollection collection;

  const RenameCollectionDialog({super.key, required this.collection});

  @override
  ConsumerState<RenameCollectionDialog> createState() =>
      _RenameCollectionDialogState();
}

class _RenameCollectionDialogState
    extends ConsumerState<RenameCollectionDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.collection.name.tr());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(LocaleKeys.common_edit.tr()),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: LocaleKeys.news_rename_bookmark.tr(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          onPressed: () {
            if (_controller.text.trim().isNotEmpty) {
              ref
                  .read(bookmarkNotifierProvider.notifier)
                  .updateCollectionName(
                    widget.collection,
                    _controller.text.trim(),
                  );
              Navigator.pop(context);
            }
          },
          child: Text(LocaleKeys.common_save.tr()),
        ),
      ],
    );
  }
}
