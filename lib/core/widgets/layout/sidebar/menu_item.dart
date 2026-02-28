import 'package:flutter/material.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.itemName,
    required this.pageNum,
    required this.currentPage,
    required this.onTap,
  });

  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final String itemName;
  final int pageNum;
  final int currentPage;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(pageNum);
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: (pageNum == currentPage)
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              (pageNum == currentPage) ? selectedIcon : unSelectedIcon,
              color: (pageNum == currentPage)
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              size: 18.0,
            ),
            Gap.w8,
            Text(
              itemName,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: (pageNum == currentPage)
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
