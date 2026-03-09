import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/constant/assets_path.dart';
import '../../../../config/theme/app_icons.dart';
import 'news_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0),
        child: SvgPicture.asset(AssetsPath.bigLogo, width: 35, height: 35),
      ),
      actions: [
        IconButton(
          onPressed: () => context.pushNamed(AppRouteConfig.notifications),
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
