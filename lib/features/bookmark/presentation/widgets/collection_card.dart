import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/scales/gap.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/locale_post.dart';

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
              .withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                collection.name,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Gap.h4,
              Text(
                "${collection.posts.length} News",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
