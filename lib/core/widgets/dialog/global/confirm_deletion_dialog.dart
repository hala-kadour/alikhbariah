import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';

Future<dynamic> confirmDeletionDialog(
  BuildContext context,
  String title,
  String content,
  void Function()? onPressed,
) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.secondaryFixed,
        ),
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(LocaleKeys.common_cancel.tr()),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error400,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.error400),
              borderRadius: BorderRadiusGeometry.circular(8.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(LocaleKeys.common_delete.tr()),
        ),
      ],
    ),
  );
}
