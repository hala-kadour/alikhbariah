import 'package:flutter/material.dart';

class MainBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainBackAppBar({super.key, this.title, this.action});
  final String? title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      actions: action != null ? [action!] : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
