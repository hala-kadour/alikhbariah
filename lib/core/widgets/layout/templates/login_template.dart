import 'package:alikhbariah/config/theme/app_scales.dart';
import 'package:flutter/material.dart';

import '../../../../config/scales/padding_config.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key, required this.child, this.width});
  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).colorScheme.surface,
      child: Center(
        child: SizedBox(
          width: 550,
          child: SingleChildScrollView(
            child: Container(
              padding: PaddingConfig.pagePadding,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                  width: 0.2,
                ),
                borderRadius: BorderRadius.circular(AppScales.borderRadius),
                color: Theme.of(context).colorScheme.surfaceContainer,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
