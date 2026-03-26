import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/theme/app_icons.dart';
import '../providers/bookmark_provider.dart';
import '../widgets/add_collection_card.dart';
import '../widgets/add_collection_dialog.dart';
import '../widgets/collection_card.dart';

class BookmarkPage extends ConsumerWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collections = ref.watch(bookmarkNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.navbar_bookmark.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: LocaleKeys.search_saved.tr(),
                prefixIcon: Icon(AppIcons.searchLight),
                suffixIcon: Icon(AppIcons.filterLight),
              ),
            ),
            Gap.h24,
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.9,
                ),
                itemCount: collections.length + 1,
                itemBuilder: (context, index) {
                  if (index == collections.length) {
                    return AddCollectionCard(
                      onTap: () => _showAddDialog(context, ref),
                    );
                  }

                  final collection = collections[index];
                  return CollectionCard(collection: collection);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => const AddCollectionDialog(),
    );
  }
}
