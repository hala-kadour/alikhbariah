import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/constant/assets_path.dart';

class NewsBar extends ConsumerStatefulWidget {
  const NewsBar({super.key});

  @override
  ConsumerState<NewsBar> createState() => _NewsBarState();
}

class _NewsBarState extends ConsumerState<NewsBar> {
  late final ScrollController _scrollController;
  bool _isScrolling = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _startScrolling() async {
    if (_isScrolling) return;
    _isScrolling = true;

    await Future.delayed(const Duration(milliseconds: 300));

    while (mounted &&
        _scrollController.hasClients &&
        _scrollController.position.maxScrollExtent > 0) {
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 16),
        curve: Curves.linear,
      );

      if (!mounted) return;

      _scrollController.jumpTo(0);
    }

    _isScrolling = false;
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(featuredPostsProvider);

    return Container(
      width: double.infinity,
      height: 33,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: posts.when(
        data: (data) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _startScrolling();
          });

          return ListView.separated(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  data[index].title,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              );
            },
            separatorBuilder: (_, _) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset(
                AssetsPath.smallLogo,
                width: 16,
                height: 16,
              ),
            ),
          );
        },
        loading: () => const SizedBox(),
        error: (e, _) => Text("Error: $e"),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
