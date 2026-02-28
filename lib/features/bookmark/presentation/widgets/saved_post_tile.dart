import 'dart:io';

import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/scales/gap.dart';
import '../../../../core/helper/device_utility.dart';
import '../../domain/models/locale_post.dart';

class SavedPostTile extends StatelessWidget {
  final LocalPost post;
  final VoidCallback onDelete;

  const SavedPostTile({super.key, required this.post, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(AppRouteConfig.savedPostDetails, extra: post),
      child: Container(
        alignment: .center,
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              width: DeviceUtility.getScreenWidth(context) * 0.2,
              height: DeviceUtility.getScreenHeight(context) * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image:
                      post.localImagePath != null &&
                          File(post.localImagePath!).existsSync()
                      ? FileImage(File(post.localImagePath!))
                      : NetworkImage(post.imageUrl ?? ''),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap.w16,
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    post.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap.h8,
                  Text(
                    post.summary,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                AppIcons.deleteLight,
                color: Theme.of(context).colorScheme.error,
              ),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
