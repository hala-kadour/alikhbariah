import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/core/widgets/containers/custom_category_name_container.dart';
import 'package:alikhbariah/features/bookmark/presentation/widgets/bookmark_icon_button.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/scales/gap.dart';
import '../../../../core/helper/device_utility.dart';
import '../../../../core/helper/time_formatter.dart';
import '../../../../core/widgets/containers/custom_linear_gradient_container.dart';
import 'breaking_news_indicators.dart';

class BreakingNewsCard extends StatelessWidget {
  const BreakingNewsCard({
    super.key,
    required this.post,
    required this.pageController,
    required this.length,
  });
  final PostModel post;
  final PageController pageController;
  final int length;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRouteConfig.postDetails, extra: post),
      child: Container(
        width: double.infinity,
        height: DeviceUtility.getScreenHeight(context) * 0.35,
        margin: EdgeInsetsDirectional.only(end: 8.0, start: 8.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(post.imageUrl ?? ""),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(24.0),
            bottomStart: Radius.circular(24.0),
          ),
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
                        "|    ${TimeFormatter.timeAgo(post.createdAt!)}",
                        style: Theme.of(context).textTheme.labelMedium!
                            .copyWith(
                              color: AppColors.white,
                              fontWeight: .w700,
                            ),
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap.h24,
              Center(
                child: BreakingNewsIndicators(
                  controller: pageController,
                  itemCount: length,
                ),
              ),
              Gap.h8,
            ],
          ),
        ),
      ),
    );
  }
}
