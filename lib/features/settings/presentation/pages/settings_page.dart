import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../translations/locale_keys.g.dart';
import '../widgets/language_selector_row.dart';
import '../widgets/notification_switch_row.dart';
import '../widgets/setting_section_wrapper.dart';
import '../widgets/social_media_row.dart';
import '../widgets/theme_selector_row.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.common_settings.tr())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // --- قسم العام ---
            SettingSectionWrapper(
              title: LocaleKeys.common_general.tr(),
              child: const Column(
                children: [
                  NotificationSwitchRow(),
                  Divider(),
                  LanguageSelectorRow(),
                  Divider(),
                  ThemeSelectorRow(),
                ],
              ),
            ),
            // --- قسم من نحن ---
            SettingSectionWrapper(
              title: LocaleKeys.common_about_us.tr(),
              child: Text(
                LocaleKeys.common_about_description.tr(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.6,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // --- قسم تواصل معنا ---
            SettingSectionWrapper(
              title: LocaleKeys.common_contact_us.tr(),
              child: const SocialMediaRow(),
            ),
          ],
        ),
      ),
    );
  }
}
