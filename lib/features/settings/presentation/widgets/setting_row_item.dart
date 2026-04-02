import 'package:alikhbariah/config/scales/gap.dart';
import 'package:flutter/material.dart';

class SettingRowItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingRowItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 22,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.8),
                ),
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
}
