import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF214b84);
  static Color secondary = Color(0xFF1BBFDC);


  // Gradient Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xfffffa9e),
      Color(0xFFFAD0C4),
      Color(0xFFFAD0C4),
    ],
  );


  // Text Colors
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF636F85);
  static const Color textThird = Color(0xFF9BA4B0);
  static const Color textBlue = Color(0xFF2196F3);
  static const Color textYellow = Color(0xffFFAB4C);
  static const Color textGrey = Color(0xFF94A3B8);
  static const Color textWhite = Color(0xFFFFFFFF);

  // Border
  static const Color textFieldBorder = Color(0xFFE2E8F0);
  static const Color buttonBorder = Color(0xFFD1D6DB);


  // Background Colors
  static const Color primaryBackGround = Color(0xFFFFFFFF);
  static const Color secondaryBackGround = Color(0xFFDEF7F8);
  static const Color backgroundLight = Color(0xFFF9FAFB);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color primaryBackground = Color(0xFFFFFFFF);

  // Surface Colors
  static const Color surfaceLight = Color(0xFFE0E0E0);
  static const Color surfaceDark = Color(0xFF2C2C2C);

  // Container Colors
  static const Color containerBackground = Color(0xFFD9D9D9);
  static const Color containerBackground2 = Color(0xFFF3F4F6);
  static const Color containerBackground1 = Color(0xFFF9F9FB);

  // Utility Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color dividerColor = Color(0xFFF3F4F6);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF29B6F6);
  /// textformfield border color

  static const Color textFormFieldBorder = Color(0xFFD9D9D9);

  // Button
  static const Color primaryButton = Color(0xFF6BAFB2);


}