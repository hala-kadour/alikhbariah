import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Theme.of(context).hoverColor,
        shape: CircleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor),
        ),
        fixedSize: Size(30, 30),
      ),
      icon: Icon(icon, size: 24.0),
    );
  }
}
