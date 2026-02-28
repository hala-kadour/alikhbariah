import 'package:alikhbariah/config/theme/app_scales.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_fonts.dart';
import '../app_text_styles.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFonts.poppins,
    scaffoldBackgroundColor: AppColors.surfacePageLight,
    primaryColor: AppColors.primaryDefault,
    primaryColorLight: AppColors.primary300,
    primaryColorDark: AppColors.primary700,
    dividerColor: AppColors.borderDefaultLight,
    hoverColor: AppColors.surfaceContainerLight,
    iconTheme: IconThemeData(
      size: AppScales.iconSize,
      color: AppColors.iconsDefaultLight,
    ),
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primaryDefault,
      primary: AppColors.primaryDefault,
      secondary: AppColors.secondaryDefault,
      secondaryFixed: AppColors.secondary600,
      onPrimary: AppColors.textOnActionLight,
      error: AppColors.errorDefault,
      onError: AppColors.textOnActionLight,
      errorContainer: AppColors.surfaceErrorLight,
      onErrorContainer: AppColors.textErrorLight,
      surface: AppColors.surfacePageLight,
      onSurface: AppColors.textHeadingsLight,
      onSurfaceVariant: AppColors.textBodyLight,
      surfaceContainer: AppColors.surfaceContainerLight,
      surfaceBright: AppColors.surfaceBrightLight,
      onSecondaryContainer: AppColors.textOnActionLight,
      outline: AppColors.borderDefaultLight,
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.surfacePageLight),
    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: AppColors.primaryDefault,
        borderRadius: BorderRadius.circular(8.0),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: AppTextStyles.labelMedium(
        color: AppColors.textOnActionLight,
        weight: FontWeight.w700,
      ),
      unselectedLabelStyle: AppTextStyles.labelMedium(
        color: AppColors.textBodyLight,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headlineLarge(),
      headlineMedium: AppTextStyles.headlineMedium(),
      headlineSmall: AppTextStyles.headlineSmall(),
      titleLarge: AppTextStyles.titleLarge(),
      titleMedium: AppTextStyles.titleMedium(),
      titleSmall: AppTextStyles.titleSmall(),
      bodyLarge: AppTextStyles.bodyLarge(),
      bodyMedium: AppTextStyles.bodyMedium(),
      bodySmall: AppTextStyles.bodySmall(),
      labelLarge: AppTextStyles.labelLarge(),
      labelMedium: AppTextStyles.labelMedium(),
      labelSmall: AppTextStyles.labelSmall(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        alignment: Alignment.center,
        fixedSize: Size(double.infinity, 45.0),
        foregroundColor: AppColors.textOnActionLight,
        backgroundColor: AppColors.primaryDefault,
        disabledBackgroundColor: AppColors.surfaceDisabledLight,
        disabledForegroundColor: AppColors.textDisabledLight,
        iconColor: AppColors.iconsOnActionLight,
        disabledIconColor: AppColors.iconsDisabledLight,
        side: BorderSide(color: AppColors.borderActionLight),
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
        foregroundColor: AppColors.textActionLight,
        disabledBackgroundColor: AppColors.surfaceDisabledLight,
        disabledForegroundColor: AppColors.textDisabledLight,
        iconColor: AppColors.iconsOnActionLight,
        disabledIconColor: AppColors.iconsDisabledLight,
        side: BorderSide(color: AppColors.borderActionLight),
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(AppScales.borderRadius),
        ),
        textStyle: AppTextStyles.buttonPrimary(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textActionLight,
        textStyle: AppTextStyles.buttonSecondary(),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.secondary800,
        iconSize: AppScales.iconSize,
      ),
    ),
    cardTheme: CardThemeData(
      elevation: 0,
      color: AppColors.surfaceContainerLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(AppScales.borderRadius),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.borderDefaultLight,
      thickness: 0.7,
    ),
    listTileTheme: ListTileThemeData(
      iconColor: AppColors.iconsDefaultLight,
      textColor: AppColors.textBodyLight,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceFieldLight,
      focusColor: AppColors.surfaceFieldLight,
      hoverColor: AppColors.surfaceFieldLight,
      labelStyle: AppTextStyles.bodyMedium(),
      hintStyle: AppTextStyles.bodySmall(),
      helperStyle: AppTextStyles.bodySmall(color: AppColors.textInfoLight),
      errorStyle: AppTextStyles.bodySmall(color: AppColors.textErrorLight),
      prefixIconColor: AppColors.iconsDefaultLight,
      suffixIconColor: AppColors.iconsActionLight,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.surfaceFieldLight),
        borderRadius: BorderRadius.circular(AppScales.borderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.surfaceFieldLight),
        borderRadius: BorderRadius.circular(AppScales.borderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderFocusLight),
        borderRadius: BorderRadius.circular(AppScales.borderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderErrorLight),
        borderRadius: BorderRadius.circular(AppScales.borderRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.borderDisabledLight),
        borderRadius: BorderRadius.circular(AppScales.borderRadius),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.surfacePageLight,
      titleTextStyle: AppTextStyles.bodyMedium(
        color: AppColors.textHeadingsLight,
      ),
    ),
  );
}
