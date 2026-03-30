import 'package:alikhbariah/config/constant/assets_path.dart';
import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/core/helper/time_formatter.dart';
import 'package:alikhbariah/features/bookmark/presentation/widgets/bookmark_icon_button.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).dividerColor,
              blurRadius: 0.5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 16.0,
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.directional(
                  topEnd: Radius.circular(16.0),
                  bottomStart: Radius.circular(16.0),
                ),
                child: Stack(
                  alignment: .topEnd,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.2,
                      child: Image.network(
                        post.imageUrl ?? '',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          return Skeletonizer(
                            enabled: true,
                            child: Container(
                              color: Colors.grey[500],
                              width: 150,
                              height: 100,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsGeometry.directional(
                        top: 5,
                        end: 5,
                      ),
                      child: SvgPicture.asset(
                        AssetsPath.tinyLogo,
                        width: 18,
                        height: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Row(
                        spacing: 8.0,
                        children: [
                          Text(
                            post.categoryName,
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: .w700,
                                ),
                          ),
                          Text(
                            TimeFormatter.timeAgo(post.createdAt!),
                            style: AppTextStyles.labelSmall(
                              color: AppColors.info400,
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
                    overflow: .ellipsis,
                  ),
                  Gap.h8,
                  Row(
                    spacing: 4.0,
                    children: [
                      Icon(AppIcons.showLight, size: 18.0),
                      Text(
                        LocaleKeys.news_views_count.tr(
                          args: [post.viewsCount.toString()],
                        ),
                        style: AppTextStyles.labelSmall(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Gap.w16,
                      Icon(AppIcons.locationLight, size: 18.0),
                      Text(
                        "${post.location}",
                        style: AppTextStyles.labelSmall(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  Gap.h8,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
