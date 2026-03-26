import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<dynamic> confirmDeletionDialog(
  BuildContext context,
  String deleteItemName,
  void Function()? onPressed,
) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        LocaleKeys.dialogs_delete_item_confirm.tr(args: [deleteItemName]),
        style: Theme.of(context).textTheme.labelLarge,
      ),
      actions: [
        // const CancelTextButton(),
        // YesTextBotton(onPressed: onPressed),
      ],
    ),
  );
}
