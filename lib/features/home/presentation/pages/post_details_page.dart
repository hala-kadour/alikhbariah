import 'dart:async';

import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/config/theme/app_icons.dart';
import 'package:alikhbariah/config/theme/app_text_styles.dart';
import 'package:alikhbariah/core/helper/helper.dart';
import 'package:alikhbariah/core/widgets/containers/custom_category_name_container.dart';
import 'package:alikhbariah/core/widgets/layout/navbar/main_back_app_bar.dart';
import 'package:alikhbariah/features/bookmark/presentation/widgets/bookmark_icon_button.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/presentation/widgets/loading_news_cards.dart';
import 'package:alikhbariah/features/home/presentation/widgets/related_post_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helper/time_formatter.dart';
import '../../../../core/widgets/containers/custom_tag_container.dart';
import '../../../../core/widgets/loadings/loading_tags.dart';
import '../providers/home_providers.dart';

class PostDetailsPage extends StatefulWidget {
  const PostDetailsPage({super.key, required this.post});
  final PostModel post;

  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  Timer? _readTimer;
  bool _counted = false;

  @override
  void initState() {
    super.initState();

    _readTimer = Timer(const Duration(seconds: 4), () {
      if (!_counted) {
        _counted = true;
        Helper.incrementView(widget.post.id);
      }
    });
  }

  @override
  void dispose() {
    _readTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBackAppBar(
        title: LocaleKeys.post_details.tr(),
        action: BookmarkIconButton(post: widget.post),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Gap.h16,
              Row(
                crossAxisAlignment: .center,
                children: [
                  CustomCategoryNameContainer(
                    categoryName: widget.post.categoryName,
                  ),
                  Gap.w16,
                  Text(
                    "|    ${TimeFormatter.timeAgo(widget.post.createdAt!)}",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              Gap.h8,
              Text(
                widget.post.title,
                style: AppTextStyles.headlineSmall(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Gap.h16,
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8.0),
                child: Image.network(widget.post.imageUrl!),
              ),
              Gap.h16,
              Row(
                spacing: 4.0,
                children: [
                  Icon(AppIcons.calendarLight),
                  Text(
                    DateFormat(
                      'd MMMM yyyy',
                      context.locale.toString(),
                    ).format(widget.post.createdAt!),
                    style: AppTextStyles.labelSmall(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Gap.w16,
                  Icon(AppIcons.showLight),
                  Text(
                    LocaleKeys.views_count.tr(
                      args: [widget.post.viewsCount.toString()],
                    ),
                    style: AppTextStyles.labelSmall(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Gap.w16,
                  Icon(AppIcons.locationLight),
                  Text(
                    widget.post.location ?? "",
                    style: AppTextStyles.labelSmall(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Gap.h16,
              Text(
                widget.post.summary ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Gap.h8,
              Text(
                widget.post.content,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Gap.h16,
              Consumer(
                builder: (context, ref, child) {
                  var res = ref.watch(postTagsProvider(widget.post.id));
                  return res.when(
                    data: (data) => Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: List.generate(
                        data.length,
                        (index) => CustomTagContainer(tag: data[index]),
                      ),
                    ),
                    error: (error, stackTrace) => Text("Error $error"),
                    loading: () => LoadingTags(),
                  );
                },
              ),
              Gap.h16,
              Text(
                LocaleKeys.related_posts.tr(),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Gap.h16,
              Consumer(
                builder: (context, ref, child) {
                  var posts = ref.watch(relatedPostsProvider(widget.post.id));
                  return posts.when(
                    data: (data) => ListView.builder(
                      itemCount: data.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RelatedPostCard(post: data[index]);
                      },
                    ),
                    error: (error, stackTrace) => Text("Error $error"),
                    loading: () => LoadingNewsCards(),
                  );
                },
              ),
              Gap.h16,
            ],
          ),
        ),
      ),
    );
  }
}
