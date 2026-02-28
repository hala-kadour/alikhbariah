import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helper/device_utility.dart';

class LoadingBreakingNewsCards extends StatefulWidget {
  const LoadingBreakingNewsCards({super.key});

  @override
  State<LoadingBreakingNewsCards> createState() =>
      _LoadingBreakingNewsCardsState();
}

class _LoadingBreakingNewsCardsState extends State<LoadingBreakingNewsCards> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        width: double.infinity,
        height: DeviceUtility.getScreenHeight(context) * 0.35,
        margin: EdgeInsetsDirectional.only(end: 8.0, start: 8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: BorderRadiusDirectional.circular(8.0),
        ),
      ),
    );
  }
}
