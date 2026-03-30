import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/features/home/data/models/video/video_category_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class VideoCategoryCard extends StatelessWidget {
  const VideoCategoryCard({super.key, required this.category});
  final VideoCategoryModel category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRouteConfig.videos, extra: category),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8.0),
          child: Image.network(
            category.imageUrl ?? "",
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return Skeletonizer(
                enabled: true,
                child: Container(
                  color: Colors.grey[300],
                  width: 150,
                  height: 200,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}
