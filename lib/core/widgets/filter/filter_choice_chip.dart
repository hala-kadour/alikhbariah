import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';

class FilterChoiceChip extends StatelessWidget {
  const FilterChoiceChip({
    super.key,
    required this.context,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onSelected,
  });

  final BuildContext context;
  final String label;
  final String? value;
  final String? groupValue;
  final Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) => onSelected(value),
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
