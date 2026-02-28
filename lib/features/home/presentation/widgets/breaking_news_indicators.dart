import 'package:flutter/material.dart';

class BreakingNewsIndicators extends StatelessWidget {
  final PageController controller;
  final int itemCount;

  const BreakingNewsIndicators({
    super.key,
    required this.controller,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        int currentPage = 0;
        if (controller.hasClients && controller.page != null) {
          currentPage = controller.page!.round() % itemCount;
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(itemCount, (index) {
            bool isActive = currentPage == index;
            return Container(
              width: 28,
              height: 28,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(2.0),
              ),
              alignment: Alignment.center,
              child: Text(
                "${index + 1}",
                style: TextStyle(
                  color: isActive
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.onPrimary,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
