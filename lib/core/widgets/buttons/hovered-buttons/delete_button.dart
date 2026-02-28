import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:alikhbariah/translation/translation.dart';
import 'package:flutter/material.dart';

import '../../../../config/scales/sizes_config.dart';
import '../../../../config/theme/app_colors.dart';

class DeleteButton extends StatefulWidget {
  const DeleteButton({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  ValueNotifier<bool> isHover = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (context) {
        isHover.value = true;
      },
      onExit: (context) {
        isHover.value = false;
      },
      child: ValueListenableBuilder(
        valueListenable: isHover,
        builder: (context, value, child) => InkWell(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: SizesConfig.animationDuration,
            ),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: value ? AppColors.red400 : Colors.transparent,
              border: Border.all(color: AppColors.red400, width: 1.1),
              shape: BoxShape.circle,
            ),
            child: Tooltip(
              message: "Delete".i18n,
              child: Icon(
                AppIcons.deleteLight,
                size: SizesConfig.iconsSm,
                color: value ? AppColors.white : AppColors.red400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
