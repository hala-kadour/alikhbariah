import 'package:flutter/material.dart';
import 'package:i18n_extension/default.i18n.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/constant/assets_path.dart';
import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';

void showSuccessDialog(BuildContext context, void Function()? onPressed) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        child: Container(
          width: SizesConfig.dialogWidthMd,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusMd),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                AnimationsPath.success,
                width: 150,
                height: 150,
                repeat: true,
              ),
              Gap.h16,
              Text(
                "Success".i18n,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Gap.h24,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: onPressed, child: Text("OK")),
              ),
            ],
          ),
        ),
      );
    },
  );
}
