import 'package:flutter/material.dart';

class PageProgressBar extends StatelessWidget {
  const PageProgressBar({
    super.key,
    required this.controller,
    required this.pageCount,
    this.height = 3,
  });

  final PageController controller;
  final int pageCount;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double page = 0;
        if (controller.hasClients && controller.page != null) {
          page = controller.page!;
        }

        final progress = ((page + 1) / pageCount).clamp(0.0, 1.0);

        return ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: LinearProgressIndicator(value: progress, minHeight: height),
        );
      },
    );
  }
}
