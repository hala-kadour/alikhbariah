import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/core/helper/time_formatter.dart';
import 'package:alikhbariah/features/bookmark/presentation/widgets/bookmark_icon_button.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/theme/app_icons.dart';
import '../../../../config/theme/app_text_styles.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(AppRouteConfig.postDetails, extra: post),
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
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(post.imageUrl ?? ""),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap.w16,
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            post.categoryName,
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.secondaryFixed,
                                ),
                          ),
                          Gap.w8,
                          Text(
                            TimeFormatter.timeAgo(post.createdAt!),
                            style: AppTextStyles.labelExtraSmall(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      BookmarkIconButton(post: post),
                    ],
                  ),
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: .fade,
                  ),
                  Gap.h8,
                  Row(
                    spacing: 4.0,
                    children: [
                      Icon(AppIcons.showLight, size: 18.0),
                      Text(
                        "${post.viewsCount} views",
                        style: AppTextStyles.labelExtraSmall(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Gap.w16,
                      Icon(AppIcons.locationLight, size: 18.0),
                      Text(
                        "${post.location}",
                        style: AppTextStyles.labelExtraSmall(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
