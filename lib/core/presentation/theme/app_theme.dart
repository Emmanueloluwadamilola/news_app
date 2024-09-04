import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/theme/color.dart';

mixin AppTheme {
  ThemeData lightTheme() {
    return ThemeData.from(
      colorScheme: const ColorScheme.light(
        primary: blueColor,
        tertiary: lowEmphasis,
        secondary: whiteColor,
        // background: backgroundColor,
      ),
    ).copyWith(
      primaryColor: blueColor,
      scaffoldBackgroundColor: backgroundColor,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontFamily: 'bold',
          color: darkText,
        ),
        titleMedium: TextStyle(
          fontFamily: 'medium',
          color: darkText,
        ),
        bodyLarge: TextStyle(
          color: darkText,
          fontFamily: 'bold',
        ),
        bodyMedium: TextStyle(
          color: darkText,
          fontFamily: 'regular',
        ),
        labelLarge: TextStyle(
          color: greyText,
          fontFamily: 'bold',
        ),
        labelMedium: TextStyle(
          color: greyText,
          fontFamily: 'medium',
        ),
        labelSmall: TextStyle(
          color: greyText,
          fontFamily: 'regular',
        ),
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData.from(colorScheme: ColorScheme.dark());
  }
}
