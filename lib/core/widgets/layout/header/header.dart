import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';
import '../../../helper/device_utility.dart';
import '../../../helper/helper.dart';
import '../../../providers/theme_provider.dart';
import '../../buttons/icon-buttons/out_line_icon_button.dart';
import '../../drop-down/langauge_drop_down_list.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({
    super.key,
    this.scaffoldKey,
    required this.currentPageIndex,
  });
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final int currentPageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).appBarTheme.backgroundColor,
        border: BorderDirectional(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: SizesConfig.md,
        vertical: SizesConfig.sm,
      ),
      child: AppBar(
        scrolledUnderElevation: 0.0,
        // Mobile Menu
        leading: !DeviceUtility.isDesktopScreen(context)
            ? IconButton(
                onPressed: () {
                  scaffoldKey?.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu),
              )
            : null,
        title: Text(
          Helper.getTitleFromIndex(currentPageIndex),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // Actions
        actions: [
          Consumer(
            builder: (context, ref, child) => OutLineIconButton(
              onPressed: () async {
                await ref.read(themeNotifierProvider.notifier).toggleTheme();
              },
              icon: Icon(
                ref.read(themeNotifierProvider.notifier).getMode() ==
                        ThemeMode.light
                    ? Icons.wb_sunny_outlined
                    : Icons.dark_mode_outlined,
              ),
            ),
          ),
          Gap.w8,
          // OutLineIconButton(
          //   onPressed: () {},
          //   icon: Icon(AppIcons.notificationLight),
          // ),
          // Gap.w8,
          TopSettingsRow(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
