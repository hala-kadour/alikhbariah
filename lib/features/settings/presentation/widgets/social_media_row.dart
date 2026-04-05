import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/constant/assets_path.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  static const String _website = "https://alikhbariah.com/";
  static const String _facebook = "https://www.facebook.com/AlekhbariahSY";
  static const String _telegram = "https://t.me/AlekhbariahSY";
  static const String _instagram = "https://www.instagram.com/AlekhbariahSY";
  static const String _x = "https://x.com/alekhbariahsy";
  static const String _youtube = "https://www.youtube.com/@AlekhbariahSY";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIcon(AssetsPath.web, _website),
        _buildIcon(AssetsPath.facebook, _facebook),
        _buildIcon(AssetsPath.telegram, _telegram),
        _buildIcon(AssetsPath.instagram, _instagram),
        _buildIcon(AssetsPath.x, _x),
        _buildIcon(AssetsPath.youtube, _youtube),
      ],
    );
  }

  Widget _buildIcon(String icon, String url) {
    return IconButton(
      onPressed: () => _launchURL(url),
      icon: SvgPicture.asset(icon, width: 28, height: 28),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // يمكنك إضافة SnackBar هنا في حال فشل الفتح
      debugPrint("Could not launch $url");
    }
  }
}
