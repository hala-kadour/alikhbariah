import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/core/widgets/containers/custom_category_name_container.dart';
import 'package:alikhbariah/features/bookmark/presentation/widgets/bookmark_icon_button.dart';
import 'package:alikhbariah/features/home/domain/models/post/post_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/scales/gap.dart';
import '../../../../core/helper/device_utility.dart';
import '../../../../core/helper/time_formatter.dart';
import '../../../../core/widgets/containers/custom_linear_gradient_container.dart';

class RelatedPostCard extends StatelessWidget {
  const RelatedPostCard({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRouteConfig.postDetails, extra: post),
      child: Container(
        width: double.infinity,
        height: DeviceUtility.getScreenHeight(context) * 0.2,
        margin: EdgeInsetsDirectional.only(end: 8.0, start: 8.0, bottom: 8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(post.imageUrl ?? ""),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadiusDirectional.circular(8.0),
        ),
        child: CustomLinearGradientContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomCategoryNameContainer(
                        categoryName: post.categoryName,
                      ),
                      Gap.w16,
                      Text(
                        "|    ${TimeFormatter.timeAgo(post.createdAt ?? DateTime.now())}",
                        style: Theme.of(
                          context,
                        ).textTheme.labelSmall!.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  BookmarkIconButton(post: post, isLighter: true),
                ],
              ),
              Spacer(),
              Text(
                post.title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
