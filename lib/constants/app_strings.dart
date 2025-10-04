class AppStrings {
  // Private constructor to prevent instantiation
  AppStrings._();

  // App title
  static const String appTitle = 'Write and Learn';

  // UI Labels
  static const String uppercase = 'UPPERCASE';
  static const String lowercase = 'LOWERCASE';

  // Tooltips
  static const String tooltipPreviousLetter = 'Previous letter';
  static const String tooltipNextLetter = 'Next letter';
  static const String tooltipUppercaseLetters = 'Uppercase letters (A-Z)';
  static const String tooltipLowercaseLetters = 'Lowercase letters (a-z)';
  static const String tooltipRandomLetter = 'Random letter';
  static const String tooltipClearDrawing = 'Clear drawing';
  static const String tooltipPlayLetterSound = 'Play letter sound';

  // Error messages
  static const String errorPlayingSound = 'Error playing sound for letter';
  static const String errorPlayingSuccessSound = 'Error playing success sound';
  static const String errorPlayingErrorSound = 'Error playing error sound';
  static const String errorPlayingClearSound = 'Error playing clear sound';

  // Progress indicator
  static const String progressFormat = '({current}/{total})';

  // Accessibility
  static const String accessibilityModelLetter = 'Model letter to learn';
  static const String accessibilityDrawingArea = 'Drawing area';
  static const String accessibilityProgressBar = 'Learning progress';
  static const String accessibilityControls = 'Letter navigation controls';
}
