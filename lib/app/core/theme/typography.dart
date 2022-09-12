import 'package:flutter/material.dart';

/// Typography
class AppTypography {
  AppTypography._();

  static const fontFamily = 'Montserrat';

  //* Headline Font Sizes
  static const headlineTitleFontSize = 48.0;

  //* Title Font Sizes
  static const largeTitleFontSize = 32.0;
  static const mediumTitleFontSize = 24.0;
  static const smallTitleFontSize = 20.0;

  //* Body Font Sizes
  static const largeBodyFontSize = 16.0;
  static const mediumBodyFontSize = 14.0;
  static const smallBodyFontSize = 12.0;

  //* Label font sizes
  static const labelFontSize = 10.0;

  //* AppBar TextStyle
  static const appBarTitleTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: mediumBodyFontSize,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  //* Button TextStyle
  static const buttonTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: largeBodyFontSize,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  //* Headline TextStyles
  static const headlineTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: headlineTitleFontSize,
    color: Colors.black,
  );

  //* Title textstyles
  static const largeTitleTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: largeTitleFontSize,
    color: Colors.black,
    height: 1.5,
  );

  static const mediumTitleTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: mediumTitleFontSize,
    color: Colors.black,
    height: 1.5,
  );

  static const smallTitleTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: smallTitleFontSize,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    height: 1.5,
  );

  //* Body textstyles (Default)
  static const largeBodyTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: largeBodyFontSize,
    color: Colors.black,
    height: 1.3,
  );

  static const mediumBodyTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: mediumBodyFontSize,
    color: Colors.black,
    height: 1.3,
  );

  static const smallBodyTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: smallBodyFontSize,
    color: Colors.black,
    height: 1.3,
  );

  //* Caption textstyles
  static const labelTextStyle = TextStyle(
    fontFamily: fontFamily,
    fontSize: labelFontSize,
    color: Colors.black,
  );
}
