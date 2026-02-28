import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/constant/assets_path.dart';
import '../../../config/scales/gap.dart';

class FailureStatusAnimation extends StatelessWidget {
  const FailureStatusAnimation({
    super.key,
    required this.errorMessage,
    this.onTap,
  });
  final String errorMessage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: Lottie.asset(AnimationsPath.noData),
        ),
        Gap.h8,
        Text(
          errorMessage,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
          textAlign: TextAlign.center,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
