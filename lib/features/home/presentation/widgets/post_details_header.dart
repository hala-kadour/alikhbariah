import 'package:alikhbariah/core/helper/time_formatter.dart';
import 'package:alikhbariah/core/widgets/containers/custom_category_name_container.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:flutter/material.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_icons.dart';
import '../../../../core/helper/device_utility.dart';
import '../../../../core/widgets/containers/custom_linear_gradient_container.dart';

class PostDetailsHeader extends StatelessWidget {
  const PostDetailsHeader({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: DeviceUtility.getScreenHeight(context) * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(post.imageUrl ?? ""),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.0)),
      ),
      // padding was 28.0
      child: CustomLinearGradientContainer(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Spacer(),
            Row(
              crossAxisAlignment: .center,
              children: [
                CustomCategoryNameContainer(categoryName: post.categoryName),
                Gap.w16,
                Text(
                  "|    ${TimeFormatter.timeAgo(post.createdAt!)}",
                  style: Theme.of(
                    context,
                  ).textTheme.labelSmall!.copyWith(color: Colors.white),
                ),
              ],
            ),
            Gap.h8,
            Text(
              post.title,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap.h8,
            Row(
              spacing: 4.0,
              children: [
                Icon(AppIcons.showLight, color: AppColors.white),
                Text(
                  "${post.viewsCount} views",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap.w16,
                Icon(AppIcons.locationLight, color: AppColors.white),
                Text(
                  post.location ?? "",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
