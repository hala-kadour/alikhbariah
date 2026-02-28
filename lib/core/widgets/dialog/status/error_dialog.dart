import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/constant/assets_path.dart';
import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';

void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    barrierDismissible: true,
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
                AnimationsPath.error,
                width: 120,
                height: 120,
                repeat: false,
              ),
              Gap.h16,
              Text(
                "Error".i18n,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap.h8,
              Text(
                errorMessage,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
                overflow: TextOverflow.fade,
              ),
              Gap.h24,
              TextButton(
                onPressed: () => context.pop(),
                child: Text("Close".i18n),
              ),
            ],
          ),
        ),
      );
    },
  );
}
