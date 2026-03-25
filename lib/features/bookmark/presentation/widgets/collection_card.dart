import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entity/locale_post.dart';

class CollectionCard extends StatelessWidget {
  final LocalCollection collection;
  final VoidCallback? onTap;

  const CollectionCard({super.key, required this.collection, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(AppRouteConfig.collectionPosts, extra: collection),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.primaries[collection.id % Colors.primaries.length]
              .withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                collection.name.tr(),
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap.h4,
              Text(
                LocaleKeys.news_count.tr(
                  args: [collection.posts.length.toString()],
                ),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
