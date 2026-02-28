import 'package:flutter/material.dart';

import '../../../config/theme/app_colors.dart';
import '../../../config/theme/app_scales.dart';

class FeaturedStateContainer extends StatelessWidget {
  const FeaturedStateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.blue50,
        border: Border.all(color: AppColors.blue200),
        borderRadius: BorderRadius.circular(AppScales.borderRadius),
      ),
      child: Text(
        "● featured",
        style: Theme.of(
          context,
        ).textTheme.labelSmall!.copyWith(color: AppColors.blueDefault),
      ),
    );
  }
}
