import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:alikhbariah/translation/translation.dart';
import 'package:flutter/material.dart';

import '../../../../config/scales/sizes_config.dart';
import '../../../../config/theme/app_colors.dart';

class EditButton extends StatefulWidget {
  const EditButton({super.key, required this.onTap});

  final void Function()? onTap;

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
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
              color: value ? AppColors.blue400 : Colors.transparent,
              border: Border.all(color: AppColors.blue400, width: 1.1),
              shape: BoxShape.circle,
            ),
            child: Tooltip(
              message: "Edit".i18n,
              child: Icon(
                AppIcons.editLight,
                size: SizesConfig.iconsSm,
                color: value ? AppColors.white : AppColors.blue400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
