import 'package:flutter/material.dart';
import '../../layout/header/header.dart';
import '../../layout/sidebar/sidebar.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({
    super.key,
    this.body,
    required this.currentPageIndex,
    required this.onItemSelected,
  });
  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final int currentPageIndex;
  final dynamic Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomSidebar(
        currentPageIndex: currentPageIndex,
        onItemSelected: onItemSelected,
      ),
      appBar: CustomHeader(
        scaffoldKey: scaffoldKey,
        currentPageIndex: currentPageIndex,
      ),
      body: body ?? const SizedBox(),
    );
  }
}
