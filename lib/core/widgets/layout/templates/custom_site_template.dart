import 'package:flutter/material.dart';

import '../../responsive/responsive_design.dart';
import '../../responsive/screens/desktop_layout.dart';
import '../../responsive/screens/mobile_layout.dart';
import '../../responsive/screens/tablet_layout.dart';

// ignore: must_be_immutable
class CustomSiteTemplate extends StatelessWidget {
  CustomSiteTemplate({
    super.key,
    this.desktop,
    this.tablet,
    this.mobile,
    required this.currentPageIndex,
    required this.onItemSelected,
  });
  // Widget for desktop layout
  final Widget? desktop;

  // Widget for tablet layout
  final Widget? tablet;

  // Widget for mobile layout
  final Widget? mobile;

  int currentPageIndex;
  dynamic Function(int) onItemSelected;

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDesign(
      desktop: DesktopLayout(
        body: desktop,
        currentPageIndex: currentPageIndex,
        onItemSelected: onItemSelected,
      ),
      tablet: TabletLayout(
        body: tablet ?? desktop,
        currentPageIndex: currentPageIndex,
        onItemSelected: onItemSelected,
      ),
      mobile: MobileLayout(
        body: mobile ?? desktop,
        currentPageIndex: currentPageIndex,
        onItemSelected: onItemSelected,
      ),
    );
  }
}
