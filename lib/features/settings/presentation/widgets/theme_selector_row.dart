import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/theme/app_icons.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../translations/locale_keys.g.dart';
import 'setting_row_item.dart';

class ThemeSelectorRow extends ConsumerWidget {
  const ThemeSelectorRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final isDarkMode = themeMode.value == ThemeMode.dark;

    return SettingRowItem(
      icon: Icons.color_lens_outlined,
      title: LocaleKeys.common_theme.tr(),
      onTap: () => _showThemeDialog(context, ref),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isDarkMode
                ? LocaleKeys.common_dark_mode.tr()
                : LocaleKeys.common_light_mode.tr(),
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

  void _showThemeDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.common_select_theme.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _themeTile(
              ref,
              context,
              Icons.wb_sunny_outlined,
              LocaleKeys.common_light_mode.tr(),
              ThemeMode.light,
            ),
            _themeTile(
              ref,
              context,
              Icons.dark_mode_outlined,
              LocaleKeys.common_dark_mode.tr(),
              ThemeMode.dark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _themeTile(
    WidgetRef ref,
    BuildContext context,
    IconData icon,
    String title,
    ThemeMode mode,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        ref.read(themeNotifierProvider.notifier).changeTheme(mode);
        Navigator.pop(context);
      },
    );
  }
}
