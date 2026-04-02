import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  static const String _website = "https://alikhbariah.com/";
  static const String _facebook = "https://www.facebook.com/AlekhbariahSY";
  static const String _telegram = "https://t.me/AlekhbariahSY";
  //static const String _instagram = "https://www.instagram.com/AlekhbariahSY";
  //static const String _x = "https://x.com/alekhbariahsy";
  static const String _youtube = "https://www.youtube.com/@AlekhbariahSY";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildIcon(Icons.language, _website),
        _buildIcon(Icons.facebook, _facebook),
        _buildIcon(Icons.telegram, _telegram),
        // _buildIcon(Icons.instagram, _instagram),
        // _buildIcon(Icons.twitter, _x),
        _buildIcon(Icons.play_circle_filled, _youtube),
      ],
    );
  }

  Widget _buildIcon(IconData icon, String url) {
    return IconButton(
      onPressed: () => _launchURL(url),
      icon: Icon(icon, size: 28, color: AppColors.primaryDefault),
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
