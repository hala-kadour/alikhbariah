import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_fonts.dart';
import '../app_scales.dart';
import '../app_text_styles.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: AppFonts.mainAppFont,
    scaffoldBackgroundColor: AppColors.surfacePageDark,
    primaryColor: AppColors.primary600,
    primaryColorLight: AppColors.primary300,
    primaryColorDark: AppColors.primary700,
    dividerColor: AppColors.borderDefaultDark,
    hoverColor: AppColors.surfaceContainerDark,
    iconTheme: IconThemeData(
      size: AppScales.iconSize,
      color: AppColors.iconsDefaultDark,
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary600,
      primary: AppColors.primaryDefault,
      secondary: AppColors.secondaryDefault,
      secondaryFixed: AppColors.secondary300,
      onPrimary: AppColors.textOnActionDark,
      error: AppColors.errorDefault,
      onError: AppColors.textOnActionDark,
      errorContainer: AppColors.surfaceErrorDark,
      onErrorContainer: AppColors.textErrorDark,
      surface: AppColors.surfacePageDark,
      onSurface: AppColors.textHeadingsDark,
      onSurfaceVariant: AppColors.textBodyDark,
      surfaceContainer: AppColors.surfaceContainerDark,
      surfaceBright: AppColors.surfaceBrightDark,
      secondaryContainer: AppColors.surfaceContainerDark,
      onSecondaryContainer: AppColors.textOnActionDark,
      outline: AppColors.borderDefaultDark,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surfacePageDark,
      scrolledUnderElevation: 0.0,
    ),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: AppColors.primaryDefault,
        borderRadius: BorderRadius.circular(12.0),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyles.labelMedium(color: AppColors.textOnActionDark),
      unselectedLabelStyle: AppTextStyles.labelMedium(
        color: AppColors.textBodyDark,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge(
        color: AppColors.textHeadingsDark,
      ),
      headlineMedium: AppTextStyles.headlineMedium(
        color: AppColors.textHeadingsDark,
      ),
      headlineSmall: AppTextStyles.headlineSmall(
        color: AppColors.textHeadingsDark,
      ),
      titleLarge: AppTextStyles.titleLarge(color: AppColors.textBodyDark),
      titleMedium: AppTextStyles.titleMedium(color: AppColors.textBodyDark),
      titleSmall: AppTextStyles.titleSmall(color: AppColors.textBodyDark),
      bodyLarge: AppTextStyles.bodyLarge(color: AppColors.textBodyDark),
      bodyMedium: AppTextStyles.bodyMedium(color: AppColors.textBodyDark),
      bodySmall: AppTextStyles.bodySmall(color: AppColors.textBodyDark),
      labelLarge: AppTextStyles.labelLarge(color: AppColors.textLabelDark),
      labelMedium: AppTextStyles.labelMedium(color: AppColors.textLabelDark),
      labelSmall: AppTextStyles.labelSmall(color: AppColors.textLabelDark),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: Size(double.infinity, 45.0),
        foregroundColor: AppColors.textOnActionDark,
        backgroundColor: AppColors.primary600,
        disabledBackgroundColor: AppColors.surfaceDisabledDark,
        disabledForegroundColor: AppColors.textDisabledDark,
        iconColor: AppColors.iconsOnActionDark,
        disabledIconColor: AppColors.iconsDisabledDark,
        side: BorderSide(color: AppColors.borderActionDark),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppScales.borderRadius),
        ),
        textStyle: AppTextStyles.buttonPrimary(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: Size(double.infinity, 45.0),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textBodyDark,
        disabledBackgroundColor: AppColors.surfaceDisabledDark,
        disabledForegroundColor: AppColors.textDisabledDark,
        iconColor: AppColors.iconsOnActionDark,
        disabledIconColor: AppColors.iconsDisabledDark,
        side: BorderSide(color: AppColors.borderDefaultDark),
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppScales.borderRadius),
        ),
        textStyle: AppTextStyles.buttonPrimary(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textActionDark,
        textStyle: AppTextStyles.buttonSecondary(),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textBodyDark,
        iconSize: AppScales.iconSize,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.surfaceContainerDark,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(AppScales.borderRadius),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.borderDefaultDark,
      thickness: 0.7,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColors.iconsDefaultDark,
      textColor: AppColors.textBodyDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceFieldDark,
      focusColor: AppColors.surfaceFieldDark,
      hoverColor: AppColors.surfaceFieldDark,
      labelStyle: AppTextStyles.bodyMedium(color: AppColors.textBodyDark),
      hintStyle: AppTextStyles.bodySmall(color: AppColors.textBodyDark),
      helperStyle: AppTextStyles.bodySmall(color: AppColors.textInfoDark),
      errorStyle: AppTextStyles.bodySmall(color: AppColors.textErrorDark),
      prefixIconColor: AppColors.iconsDefaultDark,
      suffixIconColor: AppColors.iconsActionDark,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.surfaceFieldDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.surfaceFieldDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderFocusDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderErrorDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDisabledDark),
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfaceFieldDark,
      titleTextStyle: AppTextStyles.bodyMedium(
        color: AppColors.textHeadingsDark,
      ),
    ),
  );
}
