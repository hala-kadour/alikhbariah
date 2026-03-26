import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:lottie/lottie.dart';

import '../../../../config/constant/assets_path.dart';
import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';

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
                LocaleKeys.common_loading.tr(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      );
    },
  );
}
