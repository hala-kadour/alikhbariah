import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/theme/app_icons.dart';
import '../../../../translations/locale_keys.g.dart';
import 'setting_row_item.dart';

class LanguageSelectorRow extends ConsumerWidget {
  const LanguageSelectorRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingRowItem(
      icon: Icons.language,
      title: LocaleKeys.common_language.tr(),
      onTap: () => _showLanguageDialog(context),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.locale.languageCode == 'ar' ? "العربية" : "English",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Icon(
            context.locale.languageCode == 'ar'
                ? AppIcons.arrowLeft2Light
                : AppIcons.arrowRight2Light,
            size: 18.0,
          ),
        ],
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.common_choose_language.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("العربية 🇸🇦"),
              onTap: () {
                context.setLocale(const Locale('ar'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("English 🇺🇸"),
              onTap: () {
                context.setLocale(const Locale('en'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
