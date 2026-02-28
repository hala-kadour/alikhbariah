import 'dart:io';

import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/config/theme/app_text_styles.dart';
import 'package:alikhbariah/core/widgets/layout/navbar/main_back_app_bar.dart';
import 'package:alikhbariah/features/bookmark/domain/models/locale_post.dart';
import 'package:alikhbariah/translation/translation.dart';
import 'package:flutter/material.dart';

class SavedPostDetailsPage extends StatelessWidget {
  const SavedPostDetailsPage({super.key, required this.post});
  final LocalPost post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBackAppBar(title: "Post Details".i18n),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Gap.h16,
              Text(
                post.title,
                style: AppTextStyles.headlineSmall(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              Gap.h16,
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8.0),
                child:
                    post.localImagePath != null &&
                        File(post.localImagePath!).existsSync()
                    ? Image.file(File(post.localImagePath!), fit: BoxFit.cover)
                    : Image.network(post.imageUrl ?? '', fit: BoxFit.cover),
              ),
              Gap.h16,
              Text(post.summary, style: AppTextStyles.titleLarge()),
              Gap.h8,
              Text(post.content, style: AppTextStyles.bodyMedium()),
              Gap.h16,
            ],
          ),
        ),
      ),
    );
  }
}
