import 'package:alikhbariah/features/home/presentation/widgets/live_stream_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/constant/assets_path.dart';
import 'news_bar.dart';
import 'notification_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0),
        child: SvgPicture.asset(AssetsPath.bigLogo, width: 40, height: 40),
      ),
      actions: [LiveStreamButton(), const NotificationButton()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: NewsBar(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
