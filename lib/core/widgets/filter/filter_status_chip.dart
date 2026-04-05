import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class FilterStatusChip extends StatelessWidget {
  const FilterStatusChip({
    super.key,
    required this.context,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  final BuildContext context;
  final String label;
  final bool isSelected;
  final Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      selectedColor: AppColors.primaryDefault.withValues(alpha: 0.2),
      backgroundColor: Theme.of(context).inputDecorationTheme.fillColor,
      checkmarkColor: AppColors.primaryDefault,
      labelStyle: TextStyle(
        color: isSelected
            ? AppColors.primaryDefault
            : Theme.of(context).colorScheme.onSurfaceVariant,
        fontSize: 12,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
