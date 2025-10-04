import 'package:flutter/services.dart';
import 'constants/app_timing.dart';
import 'constants/app_strings.dart';

class SoundService {
  static final SoundService _instance = SoundService._internal();
  factory SoundService() => _instance;
  SoundService._internal();

  // Generates haptic feedback for letter
  Future<void> playLetterSound(String letter) async {
    try {
      // Different haptic feedback for different letters
      if (letter.toUpperCase() == letter) {
        // Uppercase letters - stronger feedback
        await HapticFeedback.mediumImpact();
        await Future.delayed(AppTiming.hapticDelayMedium);
        await HapticFeedback.lightImpact();
      } else {
        // Lowercase letters - lighter feedback
        await HapticFeedback.lightImpact();
        await Future.delayed(AppTiming.hapticDelayShort);
        await HapticFeedback.selectionClick();
      }
    } catch (e) {
      print('${AppStrings.errorPlayingSound} $letter: $e');
    }
  }

  // Haptic feedback for successfully completed letter
  Future<void> playSuccessSound() async {
    try {
      await HapticFeedback.heavyImpact();
      await Future.delayed(AppTiming.successHeavyDelay);
      await HapticFeedback.mediumImpact();
      await Future.delayed(AppTiming.successMediumDelay);
      await HapticFeedback.lightImpact();
    } catch (e) {
      print('${AppStrings.errorPlayingSuccessSound}: $e');
    }
  }

  // Haptic feedback for error
  Future<void> playErrorSound() async {
    try {
      await HapticFeedback.selectionClick();
      await Future.delayed(AppTiming.errorClickDelay);
      await HapticFeedback.selectionClick();
    } catch (e) {
      print('${AppStrings.errorPlayingErrorSound}: $e');
    }
  }

  // Haptic feedback for clearing
  Future<void> playClearSound() async {
    try {
      await HapticFeedback.lightImpact();
      await Future.delayed(AppTiming.clearImpactDelay);
      await HapticFeedback.selectionClick();
    } catch (e) {
      print('${AppStrings.errorPlayingClearSound}: $e');
    }
  }
}
