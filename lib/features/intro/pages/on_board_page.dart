import 'package:alikhbariah/config/router/app_route_config.dart';
import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/core/helper/device_utility.dart';
import 'package:alikhbariah/core/widgets/buttons/elevated-buttons/main_elevated_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/constant/assets_path.dart';
import '../../../core/widgets/layout/pageview/page_progress_bar.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  final List<_OnBoardingModel> _pages = [
    _OnBoardingModel(
      image: AnimationsPath.onBoarding1,
      title: LocaleKeys.onboarding_desc_1.tr(),
    ),
    _OnBoardingModel(
      image: AnimationsPath.onBoarding2,
      title: LocaleKeys.onboarding_desc_2.tr(),
    ),
    _OnBoardingModel(
      image: AnimationsPath.onBoarding3,
      title: LocaleKeys.onboarding_desc_3.tr(),
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    _currentIndex.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentIndex.value < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _setFirst();
      context.pushReplacementNamed(AppRouteConfig.home);
    }
  }

  void _setFirst() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirst', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AssetsPath.bigLogo, width: 20, height: 20),
                TextButton(
                  onPressed: () {
                    _setFirst();
                    context.pushReplacementNamed(AppRouteConfig.home);
                  },
                  child: Text(LocaleKeys.common_skip.tr()),
                ),
              ],
            ),
          ),
          // Body
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) => _currentIndex.value = index,
              itemBuilder: (context, index) {
                return _OnBoardingItem(
                  model: _pages[index],
                  onNext: _nextPage,
                  pageController: _pageController,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OnBoardingItem extends StatelessWidget {
  final _OnBoardingModel model;
  final VoidCallback? onNext;
  final PageController pageController;

  const _OnBoardingItem({
    required this.model,
    required this.onNext,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Lottie.asset(model.image, width: 300),
        Gap.h16,
        Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 48.0),
          width: double.infinity,
          height: DeviceUtility.getScreenHeight(context) * 0.44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            children: [
              Text(
                model.title,
                textAlign: .center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondaryFixed,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gap.h24,
              SizedBox(
                width: DeviceUtility.getScreenWidth(context) * 0.3,
                child: PageProgressBar(
                  controller: pageController,
                  pageCount: 3,
                  height: 6,
                ),
              ),
              Gap.h24,
              MainElevatedButton(
                onTap: onNext,
                title: LocaleKeys.common_next.tr(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OnBoardingModel {
  final String image;
  final String title;

  const _OnBoardingModel({required this.image, required this.title});
}
