import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/theme_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final isDarkMode = themeMode.value == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.settings.tr())),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.h32,
            Text(
              LocaleKeys.general.tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Gap.h16,
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              child: Column(
                children: [
                  // --- قسم الإشعارات مع Switch ---
                  _buildSettingRow(
                    context,
                    icon: Icons.notifications_none,
                    title: LocaleKeys.notification.tr(),
                    trailing: Switch.adaptive(
                      value: true, // هنا نربطها ببروفايدر الإشعارات لاحقاً
                      onChanged: (value) {
                        // منطق تفعيل/تعطيل الإشعارات
                      },
                    ),
                  ),
                  const Divider(),
                  Gap.h16,
                  // --- قسم اللغة مع Dialog ---
                  _buildSettingRow(
                    context,
                    icon: Icons.language,
                    title: LocaleKeys.language.tr(),
                    onTap: () => _showLanguageDialog(context),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.locale.languageCode == 'ar'
                              ? "العربية"
                              : "English",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Icon(
                          context.locale.languageCode == 'ar'
                              ? AppIcons.arrowLeft2Light
                              : AppIcons.arrowRight2Light,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                  Gap.h16,
                  const Divider(),
                  Gap.h16,
                  // --- قسم الثيم مع Dialog أو Toggle ---
                  _buildSettingRow(
                    context,
                    icon: Icons.color_lens_outlined,
                    title: LocaleKeys.theme.tr(),
                    onTap: () => _showThemeDialog(context, ref),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          isDarkMode
                              ? LocaleKeys.dark_mode.tr()
                              : LocaleKeys.light_mode.tr(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Icon(
                          context.locale.languageCode == 'ar'
                              ? AppIcons.arrowLeft2Light
                              : AppIcons.arrowRight2Light,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ويدجت مساعدة لبناء الأسطر بشكل نظيف
  Widget _buildSettingRow(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).colorScheme.onSurface),
                Gap.w8,
                Text(title, style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
            ?trailing,
          ],
        ),
      ),
    );
  }

  // ديالوغ اختيار اللغة
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.choose_language.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text("العربية 🇸🇦"),
              onTap: () {
                context.setLocale(const Locale('ar', 'SA'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("English 🇺🇸"),
              onTap: () {
                context.setLocale(const Locale('en', 'US'));
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // ديالوغ اختيار الثيم
  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.select_theme.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.wb_sunny_outlined),
              title: Text(LocaleKeys.light_mode.tr()),
              onTap: () {
                ref
                    .read(themeNotifierProvider.notifier)
                    .changeTheme(ThemeMode.light);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.dark_mode_outlined),
              title: Text(LocaleKeys.dark_mode.tr()),
              onTap: () {
                ref
                    .read(themeNotifierProvider.notifier)
                    .changeTheme(ThemeMode.dark);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
