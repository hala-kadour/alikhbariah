import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCategoryNameContainer extends StatelessWidget {
  const CustomCategoryNameContainer({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Text(
        categoryName,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: AppColors.secondary800,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
