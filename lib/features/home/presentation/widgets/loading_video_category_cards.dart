import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingVideoCategoryCards extends StatelessWidget {
  const LoadingVideoCategoryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: .horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => Container(
            height: 200,
            width: 200,
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
      ),
    );
  }
}
