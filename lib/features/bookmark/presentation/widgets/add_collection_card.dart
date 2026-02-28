import 'package:flutter/material.dart';

class AddCollectionCard extends StatelessWidget {
  final VoidCallback onTap;

  const AddCollectionCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 40,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
