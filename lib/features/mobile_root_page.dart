import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/widgets/layout/navbar/main_bottom_nav_bar.dart';

class MobileRootPage extends StatefulWidget {
  const MobileRootPage({super.key, required this.shell});
  final StatefulNavigationShell shell;

  @override
  State<MobileRootPage> createState() => _MobileRootPageState();
}

class _MobileRootPageState extends State<MobileRootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.shell,
      bottomNavigationBar: MainBottomNavBar(
        currentIndex: widget.shell.currentIndex,
        onTap: (index) => widget.shell.goBranch(index),
      ),
    );
  }
}
