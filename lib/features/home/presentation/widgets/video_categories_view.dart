import 'package:alikhbariah/core/widgets/animation/empty_status_animation.dart';
import 'package:alikhbariah/core/widgets/animation/error_status_animation.dart';
import 'package:alikhbariah/features/home/presentation/providers/home_providers.dart';
import 'package:alikhbariah/features/home/presentation/widgets/loading_video_category_cards.dart';
import 'package:alikhbariah/features/home/presentation/widgets/video_category_card.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoCategoriesView extends StatelessWidget {
  const VideoCategoriesView({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final posts = ref.watch(videosCategoriesProvider(type));

        return posts.when(
          data: (data) => SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: .horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data.isEmpty) {
                  return Center(
                    child: EmptyStatusAnimation(
                      title: LocaleKeys.empty_no_categories.tr(),
                    ),
                  );
                } else {
                  return VideoCategoryCard(category: data[index]);
                }
              },
            ),
          ),
          error: (error, _) =>
              Center(child: ErrorStatusAnimation(errorMessage: "$error")),
          loading: () => LoadingVideoCategoryCards(),
        );
      },
    );
  }
}
