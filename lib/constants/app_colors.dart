import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Primary colors
  static const Color primaryBlue = Color(0xFF2196F3);
  static const Color primaryGreen = Color(0xFF4CAF50);
  static const Color primaryOrange = Color(0xFFFF9800);
  static const Color primaryPink = Color(0xFFE91E63);
  static const Color primaryPurple = Color(0xFF9C27B0);
  static const Color primaryTeal = Color(0xFF009688);

  // Shade variations
  static const Color blue300 = Color(0xFF64B5F6);
  static const Color blue400 = Color(0xFF42A5F5);
  static const Color blue700 = Color(0xFF1976D2);
  static const Color blue100 = Color(0xFFBBDEFB);
  static const Color blue50 = Color(0xFFE3F2FD);
  static const Color blue200 = Color(0xFF90CAF9);

  static const Color green300 = Color(0xFF81C784);
  static const Color green400 = Color(0xFF66BB6A);
  static const Color green700 = Color(0xFF388E3C);
  static const Color green100 = Color(0xFFC8E6C9);

  static const Color orange400 = Color(0xFFFFA726);
  static const Color pink400 = Color(0xFFEC407A);
  static const Color purple400 = Color(0xFFAB47BC);
  static const Color teal400 = Color(0xFF26A69A);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);

  // Gradient colors for uppercase letters
  static const List<Color> uppercaseGradient = [blue300, purple400];
  
  // Gradient colors for lowercase letters
  static const List<Color> lowercaseGradient = [green300, teal400];

  // Progress bar colors
  static const Color progressUppercase = orange400;
  static const Color progressLowercase = pink400;

  // Button colors
  static const Color buttonPrevious = orange400;
  static const Color buttonNext = pink400;
  static const Color buttonUppercase = blue400;
  static const Color buttonLowercase = green400;
  static const Color buttonRandom = purple400;

  // Indicator colors
  static const Color indicatorUppercase = blue700;
  static const Color indicatorLowercase = green700;
  static const Color indicatorUppercaseBg = blue100;
  static const Color indicatorLowercaseBg = green100;
  static const Color indicatorUppercaseBorder = blue300;
  static const Color indicatorLowercaseBorder = green300;

  // Drawing area colors
  static const Color drawingAreaBorder = blue200;
  static const Color drawingAreaGradientStart = white;
  static const Color drawingAreaGradientEnd = blue50;

  // Shadow colors
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowStrong = Color(0x4D000000);
}
