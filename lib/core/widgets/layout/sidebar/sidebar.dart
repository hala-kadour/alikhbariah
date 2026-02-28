import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:alikhbariah/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/constant/assets_path.dart';
import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';
import 'menu_item.dart';

class CustomSidebar extends StatefulWidget {
  const CustomSidebar({
    super.key,
    required this.currentPageIndex,
    required this.onItemSelected,
  });

  final int currentPageIndex;
  final Function(int) onItemSelected;

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BorderDirectional(),
      backgroundColor: AppColors.secondary900,
      child: Padding(
        padding: const EdgeInsets.all(SizesConfig.md),
        child: Column(
          mainAxisSize: .max,
          crossAxisAlignment: .start,
          spacing: 8.0,
          children: [
            Gap.h8,
            Row(
              spacing: 8.0,
              children: [
                SvgPicture.asset(AssetsPath.smallLogo, width: 20, height: 20),
                Text(
                  "Alikhbariah",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(color: AppColors.white),
                ),
              ],
            ),
            // Center(
            //   child: SvgPicture.asset(
            //     AssetsPath.bigLogo,
            //     width: 30,
            //     height: 30,
            //   ),
            // ),
            Gap.h16,
            MenuItem(
              selectedIcon: AppIcons.categoryBold,
              unSelectedIcon: AppIcons.categoryLight,
              itemName: "Dashboard".i18n,
              pageNum: 0,
              currentPage: widget.currentPageIndex,
              onTap: widget.onItemSelected,
            ),
            MenuItem(
              selectedIcon: AppIcons.discoveryBold,
              unSelectedIcon: AppIcons.discoveryLight,
              itemName: "Category".i18n,
              pageNum: 1,
              currentPage: widget.currentPageIndex,
              onTap: widget.onItemSelected,
            ),
            MenuItem(
              selectedIcon: AppIcons.sendBold,
              unSelectedIcon: AppIcons.sendLight,
              itemName: "Posts".i18n,
              pageNum: 2,
              currentPage: widget.currentPageIndex,
              onTap: widget.onItemSelected,
            ),
            MenuItem(
              selectedIcon: AppIcons.notificationBold,
              unSelectedIcon: AppIcons.notificationLight,
              itemName: "Notifications",
              pageNum: 3,
              currentPage: widget.currentPageIndex,
              onTap: widget.onItemSelected,
            ),
            // MenuItem(
            //   selectedIcon: AppIcons.settingBold,
            //   unSelectedIcon: AppIcons.settingLight,
            //   itemName: "Settings",
            //   pageNum: 4,
            //   currentPage: widget.currentPageIndex,
            //   onTap: widget.onItemSelected,
            // ),
            Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout),
              label: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
