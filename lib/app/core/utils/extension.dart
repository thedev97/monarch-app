import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/core/theme/typography.dart';

// ?? extension for sized-context
extension PercentSized on double {
  double get hp => (Get.height * (this / 100));

  double get wp => (Get.width * (this / 100));
}

// ?? extension for responsive text
extension ResponsiveText on double {
  double get sp => Get.width / 100 * (this / 3);
}

// ?? Starting with Dart 2.6.0, you can create an extension for the Color class
// that lets you use hexadecimal color strings to create a Color object:
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ThemeDataX on ThemeData {

  /// theme Colors
  static const lightThemeSecondaryFontColor = Color(0xFF666669);
  static const lightThemeTertiaryFontColor = Color(0xFF9D9FA3);

  /// Current brightness
  bool get isDark => brightness == Brightness.dark;

  /// Primary textstyle should be used from ThemeDefined themedata

  /// Secondary font color according to theme mode
  Color get secondaryFontColor => lightThemeSecondaryFontColor;

  /// Tertiary font color according to theme mode
  Color get tertiaryFontColor => lightThemeTertiaryFontColor;

  /// Headline textstyle with secondary content color
  TextStyle get headlineTitleSecondaryTextStyle =>
      AppTypography.headlineTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Headline textstyle with tertiary content color
  TextStyle get headlineTitleTertiaryTextStyle =>
      AppTypography.headlineTextStyle.copyWith(
        color: tertiaryFontColor,
      );

  /// Large title textstyle with secondary content color
  TextStyle get largeTitleSecondaryTextStyle =>
      AppTypography.largeTitleTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Large title textstyle with tertiary content color
  TextStyle get largeTitleTertiaryTextStyle =>
      AppTypography.largeTitleTextStyle.copyWith(
        color: tertiaryFontColor,
      );

  /// Medium title textstyle with secondary content color
  TextStyle get mediumTitleSecondaryTextStyle =>
      AppTypography.mediumTitleTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Medium title textstyle with tertiary content color
  TextStyle get mediumTitleTertiaryTextStyle =>
      AppTypography.mediumTitleTextStyle.copyWith(
        color: tertiaryFontColor,
      );

  /// Small title textstyle with secondary content color
  TextStyle get smallTitleSecondaryTextStyle =>
      AppTypography.smallTitleTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Small title textstyle with tertiary content color
  TextStyle get smallTitleTertiaryTextStyle =>
      AppTypography.smallTitleTextStyle.copyWith(
        color: tertiaryFontColor,
      );

  /// Large body textstyle with secondary content color
  TextStyle get largeBodySecondaryTextStyle =>
      AppTypography.largeBodyTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Large body textstyle with tertiary content color
  TextStyle get largeBodyTertiaryTextStyle =>
      AppTypography.largeBodyTextStyle.copyWith(
        color: tertiaryFontColor,
      );

  /// Medium body textstyle with secondary content color
  TextStyle get mediumBodySecondaryTextStyle =>
      AppTypography.mediumBodyTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Medium body textstyle with tertiary content color
  TextStyle get mediumBodyTertiaryTextStyle =>
      AppTypography.mediumBodyTextStyle.copyWith(
        color: tertiaryFontColor,
      );

  /// Small body textstyle with secondary content color
  TextStyle get smallBodySecondaryTextStyle =>
      AppTypography.smallBodyTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Small body textstyle with tertiary content color
  TextStyle get smallBodyTertiaryTextStyle =>
      AppTypography.smallBodyTextStyle.copyWith(
        color: tertiaryFontColor,
      );

  /// Label textstyle with secondary content color
  TextStyle get labelSecondaryTextStyle =>
      AppTypography.labelTextStyle.copyWith(
        color: secondaryFontColor,
      );

  /// Label textstyle with tertiary content color
  TextStyle get labelTertiaryTextStyle => AppTypography.labelTextStyle.copyWith(
        color: tertiaryFontColor,
      );
}
