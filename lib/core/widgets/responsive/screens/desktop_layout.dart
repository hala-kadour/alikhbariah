import 'package:flutter/material.dart';

import '../../layout/header/header.dart';
import '../../layout/sidebar/sidebar.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({
    super.key,
    this.body,
    required this.currentPageIndex,
    required this.onItemSelected,
  });
  final Widget? body;
  final int currentPageIndex;
  final dynamic Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: CustomSidebar(
              currentPageIndex: currentPageIndex,
              onItemSelected: onItemSelected,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // HEADER
                CustomHeader(currentPageIndex: currentPageIndex),
                // BODY
                Expanded(child: body ?? const SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
