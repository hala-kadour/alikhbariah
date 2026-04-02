import 'package:flutter/material.dart';

class FilterSectionTitle extends StatelessWidget {
  const FilterSectionTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
