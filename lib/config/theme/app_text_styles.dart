import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  const AppTextStyles._();

  /* Display Large */
  static TextStyle displayLargeBold({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 56,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.14, // ~64/56
    );
  }

  static TextStyle displayLargeSemiBold({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 56,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.14,
    );
  }

  static TextStyle displayLargeRegular({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 56,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.14,
    );
  }

  /* Display Medium */
  static TextStyle displayMediumBold({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 44,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.18, // ~52/44
    );
  }

  static TextStyle displayMediumSemiBold({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 44,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.18,
    );
  }

  static TextStyle displayMediumRegular({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 44,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.18,
    );
  }

  /* Display Small */
  static TextStyle displaySmallBold({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 36,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.22, // ~44/36
    );
  }

  static TextStyle displaySmallSemiBold({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 36,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.22,
    );
  }

  static TextStyle displaySmallRegular({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 36,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
      height: 1.22,
    );
  }

  // Headline
  /* Headline Large */
  static TextStyle headlineLarge({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 32,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0,
      height: 1.25, // 40/32
    );
  }

  /* Headline Medium */
  static TextStyle headlineMedium({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 28,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0,
      height: 1.29, // ~36/28
    );
  }

  /* Headline Small */
  static TextStyle headlineSmall({
    Color? color,
    FontWeight weight = FontWeight.w600,
  }) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 24,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0,
      height: 1.33, // 32/24
    );
  }

  // Title
  static TextStyle titleLarge({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 22,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0,
      height: 1.27, // ~28/22
    );
  }

  static TextStyle titleMedium({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 16,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0,
      height: 1.5, // 24/16
    );
  }

  static TextStyle titleSmall({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textHeadingsLight,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0,
      height: 1.43, // ~20/14
    );
  }

  // Body
  static TextStyle bodyLarge({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textBodyLight,
      fontSize: 16,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.5, // 24/16
    );
  }

  static TextStyle bodyMedium({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textBodyLight,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.43, // 20/14
    );
  }

  static TextStyle bodySmall({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textBodyLight,
      fontSize: 12,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.33, // 16/12
    );
  }

  // Label (buttons, chips)
  static TextStyle labelLarge({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textLabelLight,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.43, // 20/14
    );
  }

  static TextStyle labelMedium({
    Color? color,
    FontWeight? weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textLabelLight,
      fontSize: 12,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.33, // 16/12
    );
  }

  static TextStyle labelSmall({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textLabelLight,
      fontSize: 10,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 1.5,
      height: 1.6, // ~16/10
    );
  }

  static TextStyle labelExtraSmall({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textLabelLight,
      fontSize: 8,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 1.5,
      height: 1.6, // ~16/10
    );
  }

  // Overline
  static TextStyle overLineSemiBold({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textBodyLight,
      fontSize: 10,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5,
      height: 1.6,
    );
  }

  static TextStyle overLineRegular({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textBodyLight,
      fontSize: 10,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.5,
      height: 1.6,
    );
  }

  // Buttons
  static TextStyle buttonPrimary({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textOnActionLight,
      fontSize: 16.0,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      height: 1.5,
    );
  }

  static TextStyle buttonSecondary({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.textOnActionLight,
      fontSize: 12,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: FontWeight.w700,
      letterSpacing: 0,
      height: 1.43,
    );
  }

  // Additional Custom Styles
  static TextStyle errorText({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.errorDefault,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.43,
    );
  }

  static TextStyle successText({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.successDefault,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.43,
    );
  }

  static TextStyle warningText({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.warningDefault,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.43,
    );
  }

  static TextStyle linkText({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.primaryDefault,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.43,
      decoration: TextDecoration.underline,
    );
  }

  static TextStyle subtitle({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textBodyLight,
      fontSize: 16,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.5,
    );
  }

  static TextStyle caption({
    Color? color,
    FontWeight weight = FontWeight.w400,
  }) {
    return TextStyle(
      color: color ?? AppColors.textBodyLight,
      fontSize: 12,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.33,
    );
  }

  static TextStyle buttonText({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textLabelLight,
      fontSize: 14,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 0.5,
      height: 1.43,
    );
  }

  static TextStyle overline({
    Color? color,
    FontWeight weight = FontWeight.w500,
  }) {
    return TextStyle(
      color: color ?? AppColors.textLabelLight,
      fontSize: 10,
      fontFamily: AppFonts.mainAppFont,
      fontWeight: weight,
      letterSpacing: 1.5,
      height: 1.6,
    );
  }
}
