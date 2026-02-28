import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomLinearGradientContainer extends StatelessWidget {
  const CustomLinearGradientContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColors.secondary700.withAlpha(100),
            AppColors.secondary700,
          ],
        ),
      ),
      child: child,
    );
  }
}
