import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/constant/assets_path.dart';
import '../../../../config/theme/app_icons.dart';
import 'news_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0),
        child: SvgPicture.asset(AssetsPath.bigLogo, width: 35, height: 35),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(AppIcons.notificationLight, size: 20.0),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: NewsBar(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
