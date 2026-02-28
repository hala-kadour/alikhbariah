import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/config/theme/app_scales.dart';
import 'package:flutter/material.dart';

class CustomCategoryStatusContainer extends StatelessWidget {
  const CustomCategoryStatusContainer({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: isActive ? AppColors.green50 : AppColors.red50,
        border: Border.all(
          color: isActive ? AppColors.green200 : AppColors.red200,
        ),
        borderRadius: BorderRadius.circular(AppScales.borderRadius),
      ),
      child: Text(
        isActive ? "● active" : "● unactive",
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
          color: isActive ? AppColors.greenDefault : AppColors.redDefault,
        ),
      ),
    );
  }
}
