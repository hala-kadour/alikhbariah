import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/constant/assets_path.dart';
import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';
import '../../../../translation/translation.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                AnimationsPath.loading,
                width: 150,
                height: 150,
                repeat: true,
              ),
              Gap.h16,
              Text(
                "Loading".i18n,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      );
    },
  );
}
