import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/constant/assets_path.dart';

class SuccessStatusAnimation extends StatelessWidget {
  const SuccessStatusAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Lottie.asset(AnimationsPath.success),
    );
  }
}
