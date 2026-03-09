import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helper/device_utility.dart';

class LoadingNewsCards extends StatefulWidget {
  const LoadingNewsCards({super.key});

  @override
  State<LoadingNewsCards> createState() => _LoadingNewsCardsState();
}

class _LoadingNewsCardsState extends State<LoadingNewsCards> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Container(
          width: double.infinity,
          height: DeviceUtility.getScreenHeight(context) * 0.12,
          margin: EdgeInsetsDirectional.only(
            end: 8.0,
            start: 8.0,
            bottom: 12.0,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadiusDirectional.circular(8.0),
          ),
        ),
      ),
    );
  }
}
