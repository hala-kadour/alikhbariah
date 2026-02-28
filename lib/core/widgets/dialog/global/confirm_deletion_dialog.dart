import 'package:alikhbariah/translation/translation.dart';
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
        "Are you sure you want to delete %S ?".i18n.fill([deleteItemName]),
        style: Theme.of(context).textTheme.labelLarge,
      ),
      actions: [
        // const CancelTextButton(),
        // YesTextBotton(onPressed: onPressed),
      ],
    ),
  );
}
