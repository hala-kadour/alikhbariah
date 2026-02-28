import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingTabBar extends StatelessWidget {
  const LoadingTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Skeletonizer(
        enabled: true,
        child: TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: List.generate(
            10,
            (index) => Tab(
              child: Container(width: 60, height: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
