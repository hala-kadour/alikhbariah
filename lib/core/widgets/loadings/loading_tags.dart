import 'package:alikhbariah/features/home/domain/models/tag/tag_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../containers/custom_tag_container.dart';

class LoadingTags extends StatefulWidget {
  const LoadingTags({super.key});

  @override
  State<LoadingTags> createState() => _LoadingTagsState();
}

class _LoadingTagsState extends State<LoadingTags> {
  final List<TagModel> _fakeData = List.filled(
    3,
    TagModel(id: "id", name: "name"),
  );
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: List.generate(
        _fakeData.length,
        (index) => Skeletonizer(
          enabled: true,
          child: CustomTagContainer(tag: _fakeData[index]),
        ),
      ),
    );
  }
}
