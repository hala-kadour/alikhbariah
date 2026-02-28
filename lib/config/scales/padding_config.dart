import 'package:flutter/material.dart';

import 'sizes_config.dart';

class PaddingConfig {
  static const EdgeInsets pagePadding = EdgeInsets.symmetric(
    horizontal: 30,
    vertical: 20,
  );
  static const EdgeInsets containerPadding = EdgeInsets.all(15);
  static const EdgeInsets rectPadding = EdgeInsets.symmetric(
    vertical: 10,
    horizontal: 40,
  );
  static const EdgeInsets paddingWithAppBarHeight = EdgeInsets.only(
    top: SizesConfig.appbarHeight,
    left: SizesConfig.defaultSpace,
    bottom: SizesConfig.defaultSpace,
    right: SizesConfig.defaultSpace,
  );
}
