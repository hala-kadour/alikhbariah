import 'package:flutter/material.dart';
import 'package:alikhbariah/translation/translation.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Row(
            spacing: 4.0,
            children: [
              SizedBox(
                height: 20,
                child: VerticalDivider(
                  color: Theme.of(context).primaryColor,
                  thickness: 3.0,
                ),
              ),
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          TextButton(onPressed: onPressed, child: Text("View all".i18n)),
        ],
      ),
    );
  }
}
