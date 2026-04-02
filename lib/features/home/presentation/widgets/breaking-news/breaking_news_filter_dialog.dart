import 'package:alikhbariah/core/widgets/animation/loading_status_animation.dart';
import 'package:alikhbariah/core/widgets/filter/filter_title.dart';
import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';

import '../../../../../config/scales/gap.dart';
import '../../../../../core/widgets/filter/filter_choice_chip.dart';
import '../../../../../core/widgets/filter/filter_section_title.dart';
import '../../../../explore/presentation/providers/explore_providers.dart';

class BreakingNewsFilterDialog extends ConsumerStatefulWidget {
  const BreakingNewsFilterDialog({super.key});

  @override
  ConsumerState<BreakingNewsFilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<BreakingNewsFilterDialog> {
  late String? localCategoryId;

  @override
  void initState() {
    super.initState();
    localCategoryId = ref.read(breakingNewsCategoryFilterProvider);
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FilterTitle(),
              Gap.h24,
              // --- قسم الصنف (ديناميكي من السيرفر) ---
              FilterSectionTitle(title: LocaleKeys.search_category.tr()),
              categoriesAsync.when(
                data: (categories) => Wrap(
                  spacing: 4.0,
                  children: [
                    // خيار "الكل"
                    FilterChoiceChip(
                      context: context,
                      label: "الكل",
                      value: null,
                      groupValue: localCategoryId,
                      onSelected: (v) => setState(() => localCategoryId = v),
                    ),
                    ...categories.map(
                      (cat) => FilterChoiceChip(
                        context: context,
                        label: cat.name,
                        value: cat.id.toString(),
                        groupValue: localCategoryId,
                        onSelected: (v) => setState(() => localCategoryId = v),
                      ),
                    ),
                  ],
                ),
                loading: () =>
                    const Center(child: LoadingStatusAnimation(size: 50)),
                error: (err, stack) => Text("error: $err"),
              ),
              Gap.h32,
              // --- أزرار التحكم ---
              Row(
                spacing: 16.0,
                children: [
                  TextButton(
                    onPressed: _handleApply,
                    child: Text(LocaleKeys.search_apply.tr()),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.onSurface,
                    ),
                    onPressed: _handleClear,
                    child: Text(LocaleKeys.search_clear.tr()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- منطق الأزرار ---

  void _handleClear() {
    ref.invalidate(breakingNewsCategoryFilterProvider);
    Navigator.pop(context);
  }

  void _handleApply() {
    ref.read(breakingNewsCategoryFilterProvider.notifier).state =
        localCategoryId;

    Navigator.pop(context);
  }
}
