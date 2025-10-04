import 'dart:ui';

class AppTiming {
  // Private constructor to prevent instantiation
  AppTiming._();

  // Haptic feedback delays
  static const Duration hapticDelayShort = Duration(milliseconds: 30);
  static const Duration hapticDelayMedium = Duration(milliseconds: 50);
  static const Duration hapticDelayLong = Duration(milliseconds: 100);
  static const Duration hapticDelayExtraLong = Duration(milliseconds: 150);

  // Animation durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);

  // UI feedback delays
  static const Duration uiFeedbackShort = Duration(milliseconds: 100);
  static const Duration uiFeedbackMedium = Duration(milliseconds: 200);
  static const Duration uiFeedbackLong = Duration(milliseconds: 300);

  // Sound effect delays
  static const Duration soundEffectShort = Duration(milliseconds: 50);
  static const Duration soundEffectMedium = Duration(milliseconds: 100);
  static const Duration soundEffectLong = Duration(milliseconds: 200);

  // Success feedback sequence
  static const Duration successHeavyDelay = Duration(milliseconds: 150);
  static const Duration successMediumDelay = Duration(milliseconds: 100);

  // Error feedback sequence
  static const Duration errorClickDelay = Duration(milliseconds: 100);

  // Clear feedback sequence
  static const Duration clearImpactDelay = Duration(milliseconds: 50);
}
