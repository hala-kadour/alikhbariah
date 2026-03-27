import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constant/assets_path.dart';

class NewsBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const NewsBar({super.key});

  @override
  ConsumerState<NewsBar> createState() => _NewsBarState();

  @override
  Size get preferredSize => const Size.fromHeight(33);
}

class _NewsBarState extends ConsumerState<NewsBar> {
  late final ScrollController _scrollController;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _startScrolling() async {
    if (_isScrolling) return;
    _isScrolling = true;

    await Future.delayed(const Duration(milliseconds: 300));

    while (mounted &&
        _scrollController.hasClients &&
        _scrollController.position.maxScrollExtent > 0) {
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 16),
        curve: Curves.linear,
      );

      if (!mounted) return;

      _scrollController.jumpTo(0);
    }

    _isScrolling = false;
  }

  @override
  Widget build(BuildContext context) {
    final postsAsync = ref.watch(newsBarProvider);

    return postsAsync.when(
      data: (data) {
        // تشغيل التمرير التلقائي
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _startScrolling();
        });

        return AnimatedContainer(
          duration: const Duration(
            milliseconds: 500,
          ), // انتقال ناعم بين الألوان
          width: double.infinity,
          height: 33,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            itemBuilder: (context, index) {
              final news = data[index];

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // إذا كان الخبر عاجل، نظهر كلمة "عاجل" بتنسيق مميز
                      if (news.isUrgent)
                        Container(
                          margin: const EdgeInsetsDirectional.only(end: 8),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            LocaleKeys.news_urgent.tr(),
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),

                      // نص الخبر الأصلي
                      Text(
                        news.content,
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, _) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SvgPicture.asset(
                AssetsPath.smallLogo,
                width: 14,
                height: 14,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        );
      },
      loading: () => const Text("Loading"),
      error: (e, _) => Text("$e"),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
