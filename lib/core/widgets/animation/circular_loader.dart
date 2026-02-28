import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../config/constant/assets_path.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Lottie.asset(AnimationsPath.loading),
    );
  }
}
