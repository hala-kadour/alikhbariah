import 'package:alikhbariah/config/scales/gap.dart';
import 'package:flutter/material.dart';

class SettingSectionWrapper extends StatelessWidget {
  final String title;
  final Widget child;

  const SettingSectionWrapper({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ),
        Gap.h8,
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), // زوايا أنعم شوي
            color: Theme.of(context).inputDecorationTheme.fillColor,
          ),
          child: child,
        ),
        Gap.h24, // مسافة بين كل قسم وقسم
      ],
    );
  }
}
