import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/constant/assets_path.dart';
import '../../../config/scales/gap.dart';

class EmptyStatusAnimation extends StatelessWidget {
  const EmptyStatusAnimation({super.key, required this.title});
  final String title;

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
          title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).primaryColor,
            fontWeight: .w600,
          ),
        ),
      ],
    );
  }
}
