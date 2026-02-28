import 'dart:async'; // استيراد التايمر
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
    _timer?.cancel(); // ضروري جداً إيقاف التايمر عند إغلاق الصفحة
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
            // تحديث منطق الدوران ليعود للبداية إذا انتهت الأخبار
            if (data.isEmpty) return const SizedBox();

            return SizedBox(
              width: double.infinity,
              height: DeviceUtility.getScreenHeight(context) * 0.35,
              child: PageView.builder(
                controller: _pageController,
                // لجعل التقليب مستمر للأبد (اختياري)
                onPageChanged: (index) {
                  _currentPage = index;
                },
                itemBuilder: (context, index) {
                  // استخدام الـ index مع modulo لضمان استمرارية التقليب
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
          error: (error, stackTrace) => Text("Error: $error"),
          loading: () => const LoadingBreakingNewsCards(),
        );
      },
    );
  }
}
