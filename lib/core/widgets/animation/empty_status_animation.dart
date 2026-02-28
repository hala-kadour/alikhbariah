import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/constant/assets_path.dart';
import '../../../config/scales/gap.dart';
import '../../../translation/translation.dart';

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
          "There is no data!".i18n,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
