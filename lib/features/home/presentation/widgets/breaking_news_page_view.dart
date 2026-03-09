import 'dart:async';
import 'package:alikhbariah/core/widgets/animation/empty_status_animation.dart';
import 'package:alikhbariah/core/widgets/animation/error_status_animation.dart';
import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:alikhbariah/features/home/presentation/widgets/breaking_news_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/helper/device_utility.dart';
import 'loading_breaking_news_cards.dart';

class BreakingNewsPageView extends StatefulWidget {
  const BreakingNewsPageView({super.key});

  @override
  State<BreakingNewsPageView> createState() => _BreakingNewsPageViewState();
}

class _BreakingNewsPageViewState extends State<BreakingNewsPageView> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageController.hasClients) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var posts = ref.watch(breakingPostsProvider);
        return posts.when(
          data: (data) {
            if (data.isEmpty) return const EmptyStatusAnimation();

            return SizedBox(
              width: double.infinity,
              height: DeviceUtility.getScreenHeight(context) * 0.35,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  _currentPage = index;
                },
                itemBuilder: (context, index) {
                  final postIndex = index % data.length;
                  return BreakingNewsCard(
                    post: data[postIndex],
                    pageController: _pageController,
                    length: data.length,
                  );
                },
              ),
            );
          },
          error: (error, stackTrace) =>
              ErrorStatusAnimation(errorMessage: "Error: $error"),
          loading: () => const LoadingBreakingNewsCards(),
        );
      },
    );
  }
}
