import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';

import '../../../config/constant/assets_path.dart';
import '../../../config/scales/gap.dart';

class EmptyStatusAnimation extends StatelessWidget {
  const EmptyStatusAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Lottie.asset(AnimationsPath.noData),
        ),
        Gap.w16,
        Text(
          LocaleKeys.no_data.tr(),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
