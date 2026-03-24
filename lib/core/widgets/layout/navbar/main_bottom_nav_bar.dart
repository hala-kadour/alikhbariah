import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/generated/locale_keys.g.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_icons.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
          gap: 8,
          iconSize: 24.0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedIndex: currentIndex,
          onTabChange: onTap,
          activeColor: Theme.of(context).colorScheme.onPrimary,
          tabBackgroundGradient: AppColors.primaryLinear,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 12.0,
          ),
          padding: EdgeInsetsGeometry.all(12.0),
          tabs: [
            GButton(icon: AppIcons.homeBold, text: LocaleKeys.home.tr()),
            GButton(icon: AppIcons.searchBold, text: LocaleKeys.explore.tr()),
            GButton(
              icon: AppIcons.bookmarkBold,
              text: LocaleKeys.bookmark.tr(),
            ),
            GButton(icon: AppIcons.settingBold, text: LocaleKeys.settings.tr()),
          ],
        ),
      ),
    );
  }
}
