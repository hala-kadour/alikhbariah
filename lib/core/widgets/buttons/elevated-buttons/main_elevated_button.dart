import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/config/theme/app_scales.dart';
import 'package:alikhbariah/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton({
    super.key,
    required this.onTap,
    required this.title,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: double.infinity,
        alignment: AlignmentGeometry.center,
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        decoration: BoxDecoration(
          gradient: AppColors.primaryLinear,
          borderRadius: BorderRadius.circular(AppScales.borderRadius),
        ),
        child: Text(title, style: AppTextStyles.buttonPrimary()),
      ),
    );
  }
}
