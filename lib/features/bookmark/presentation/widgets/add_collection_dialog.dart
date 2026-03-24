import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:alikhbariah/config/theme/app_text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bookmark_provider.dart';

class AddCollectionDialog extends StatefulWidget {
  const AddCollectionDialog({super.key});

  @override
  State<AddCollectionDialog> createState() => _AddCollectionDialogState();
}

class _AddCollectionDialogState extends State<AddCollectionDialog> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.add_bookmark.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceBright,
                hoverColor: Theme.of(context).colorScheme.surfaceBright,
                hintText: LocaleKeys.title.tr(),
                prefixIcon: const Icon(AppIcons.bookmarkLight),
              ),
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      LocaleKeys.cancel.tr(),
                      style: AppTextStyles.buttonSecondary(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            ref
                                .read(bookmarkNotifierProvider.notifier)
                                .saveCollection(_controller.text);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(LocaleKeys.save.tr()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
