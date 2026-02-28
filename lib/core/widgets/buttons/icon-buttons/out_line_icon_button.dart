import 'package:flutter/material.dart';

import '../../../../config/theme/app_scales.dart';

class OutLineIconButton extends StatelessWidget {
  const OutLineIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).hoverColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppScales.borderRadius),
          side: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      icon: icon,
    );
  }
}
