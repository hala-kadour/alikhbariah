import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/features/home/domain/models/tag/tag_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomTagContainer extends StatelessWidget {
  const CustomTagContainer({super.key, required this.tag});
  final TagModel tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.goNamed(AppRouteConfig.tagSearch, extra: tag),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).inputDecorationTheme.fillColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          "#${tag.name}",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: Theme.of(context).colorScheme.secondaryFixed,
          ),
        ),
      ),
    );
  }
}
