import 'package:alikhbariah/core/widgets/animation/loading_status_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';

import '../../../../config/scales/gap.dart';
import '../../../../core/widgets/filter/filter_choice_chip.dart';
import '../../../../core/widgets/filter/filter_section_title.dart';
import '../../../../core/widgets/filter/filter_status_chip.dart';
import '../../../../core/widgets/filter/filter_title.dart';
import '../providers/explore_providers.dart';

class SearchFilterDialog extends ConsumerStatefulWidget {
  const SearchFilterDialog({super.key});

  @override
  ConsumerState<SearchFilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<SearchFilterDialog> {
  late String localTime;
  late String? localCategoryId;
  late bool localUrgent;
  late bool localFeatured;

  @override
  void initState() {
    super.initState();
    localTime = ref.read(searchTimeFilterProvider);
    localCategoryId = ref.read(searchCategoryFilterProvider);
    localUrgent = ref.read(isUrgentFilterProvider);
    localFeatured = ref.read(isFeaturedFilterProvider);
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
              // --- قسم الزمن ---
              FilterSectionTitle(title: LocaleKeys.search_time.tr()),
              Wrap(
                spacing: 4.0,
                runSpacing: 4.0,
                children: [
                  FilterChoiceChip(
                    context: context,
                    label: LocaleKeys.search_all_time.tr(),
                    value: "all_time",
                    groupValue: localTime,
                    onSelected: (v) => setState(() => localTime = v!),
                  ),
                  FilterChoiceChip(
                    context: context,
                    label: LocaleKeys.search_today.tr(),
                    value: "today",
                    groupValue: localTime,
                    onSelected: (v) => setState(() => localTime = v!),
                  ),
                  FilterChoiceChip(
                    context: context,
                    label: LocaleKeys.search_this_week.tr(),
                    value: "week",
                    groupValue: localTime,
                    onSelected: (v) => setState(() => localTime = v!),
                  ),
                ],
              ),
              Gap.h16,
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
              Gap.h16,
              // --- قسم الحالة (عاجل / مميز) ---
              FilterSectionTitle(title: LocaleKeys.search_status.tr()),
              Row(
                children: [
                  FilterStatusChip(
                    context: context,
                    label: LocaleKeys.search_urgent.tr(),
                    isSelected: localUrgent,
                    onSelected: (v) => setState(() => localUrgent = v),
                  ),
                  Gap.w4,
                  FilterStatusChip(
                    context: context,
                    label: LocaleKeys.search_featured.tr(),
                    isSelected: localFeatured,
                    onSelected: (v) => setState(() => localFeatured = v),
                  ),
                ],
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

  // --- دوال المساعدة للـ UI ---

  // --- منطق الأزرار ---

  void _handleClear() {
    // تصفير جميع الـ Providers وحذف الحالات
    ref.invalidate(searchTimeFilterProvider);
    ref.invalidate(searchCategoryFilterProvider);
    ref.invalidate(isUrgentFilterProvider);
    ref.invalidate(isFeaturedFilterProvider);
    Navigator.pop(context);
  }

  void _handleApply() {
    // تحديث الـ Providers بالقيم التي تم اختيارها في الديالوغ
    ref.read(searchTimeFilterProvider.notifier).state = localTime;
    ref.read(searchCategoryFilterProvider.notifier).state = localCategoryId;
    ref.read(isUrgentFilterProvider.notifier).state = localUrgent;
    ref.read(isFeaturedFilterProvider.notifier).state = localFeatured;

    // إغلاق الديالوغ (الـ searchedPostsProvider سيحدث نفسه تلقائياً)
    Navigator.pop(context);
  }
}
