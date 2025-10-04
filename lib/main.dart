import 'package:flutter/material.dart';
import 'dart:math';
import 'sound_service.dart';
import 'constants/app_colors.dart';
import 'constants/app_dimensions.dart';
import 'constants/app_strings.dart';

void main() {
  runApp(const LearningApp());
}

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        // Child-friendly font
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: AppDimensions.fontSizeL,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
          bodyLarge: TextStyle(
            fontSize: AppDimensions.fontSizeM,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      home: const LearningHomePage(),
    );
  }
}

class LearningHomePage extends StatefulWidget {
  const LearningHomePage({super.key});

  @override
  State<LearningHomePage> createState() => _LearningHomePageState();
}

class _LearningHomePageState extends State<LearningHomePage> {
  // List of letters that children can learn - complete alphabet
  final List<String> letters = [
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
  ];
  int currentLetterIndex = 0;
  
  // List of points for drawing
  List<Offset> points = [];
  
  // Pen color
  Color penColor = Colors.black;
  double penWidth = 12.0;
  
  // Sound service
  final SoundService _soundService = SoundService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write and Learn (${currentLetterIndex + 1}/${letters.length})'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              setState(() {
                points.clear();
              });
              await _soundService.playClearSound();
            },
            tooltip: 'Clear drawing',
          ),
          IconButton(
            icon: const Icon(Icons.volume_up),
            onPressed: () async {
              await _soundService.playLetterSound(letters[currentLetterIndex]);
            },
            tooltip: 'Play letter sound',
          ),
        ],
      ),
      body: Column(
        children: [
          // Model letter - large display of the letter that children need to learn
          Container(
            height: AppDimensions.modelLetterHeight,
            width: double.infinity,
            margin: const EdgeInsets.all(AppDimensions.modelLetterMargin),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: currentLetterIndex < 26 
                  ? AppColors.uppercaseGradient
                  : AppColors.lowercaseGradient,
              ),
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: GestureDetector(
              onTap: () async {
                await _soundService.playLetterSound(letters[currentLetterIndex]);
              },
              child: Center(
                child: Text(
                  letters[currentLetterIndex],
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeXL,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    shadows: [
                      Shadow(
                        color: AppColors.shadowMedium,
                        offset: const Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Progress bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimensions.progressBarMargin),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
              child: LinearProgressIndicator(
                value: (currentLetterIndex + 1) / letters.length,
                backgroundColor: AppColors.grey200,
                valueColor: AlwaysStoppedAnimation<Color>(
                  currentLetterIndex < 26 
                    ? AppColors.progressUppercase
                    : AppColors.progressLowercase,
                ),
                minHeight: AppDimensions.progressBarHeight,
              ),
            ),
          ),
          
          // Indicator whether it's uppercase or lowercase letter
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDimensions.indicatorMargin, vertical: AppDimensions.spacingS),
            padding: const EdgeInsets.symmetric(horizontal: AppDimensions.indicatorPadding, vertical: AppDimensions.spacingS),
            decoration: BoxDecoration(
              color: currentLetterIndex < 26 
                ? AppColors.indicatorUppercaseBg
                : AppColors.indicatorLowercaseBg,
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              border: Border.all(
                color: currentLetterIndex < 26 
                  ? AppColors.indicatorUppercaseBorder
                  : AppColors.indicatorLowercaseBorder,
                width: AppDimensions.indicatorBorderWidth,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  currentLetterIndex < 26 ? Icons.arrow_upward : Icons.arrow_downward,
                  color: currentLetterIndex < 26 ? AppColors.primaryBlue : AppColors.primaryGreen,
                  size: AppDimensions.indicatorIconSize,
                ),
                const SizedBox(width: AppDimensions.spacingS),
                Text(
                  currentLetterIndex < 26 ? AppStrings.uppercase : AppStrings.lowercase,
                  style: TextStyle(
                    fontSize: AppDimensions.fontSizeS,
                    fontWeight: FontWeight.bold,
                    color: currentLetterIndex < 26 ? AppColors.indicatorUppercase : AppColors.indicatorLowercase,
                  ),
                ),
              ],
            ),
          ),
          
          // Drawing space
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppDimensions.drawingAreaMargin),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.drawingAreaGradientStart,
                    AppColors.drawingAreaGradientEnd,
                  ],
                ),
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                border: Border.all(
                  color: AppColors.drawingAreaBorder,
                  width: AppDimensions.drawingAreaBorderWidth,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowMedium,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    points.add(details.localPosition);
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    points.add(details.localPosition);
                  });
                },
                onPanEnd: (details) {
                  // Add null as marker for end of line
                  setState(() {
                    points.add(Offset.infinite);
                  });
                },
                child: CustomPaint(
                  painter: DrawingPainter(points, penColor, penWidth),
                  size: Size.infinite,
                ),
              ),
            ),
          ),
          
          // Controls
          Container(
            padding: const EdgeInsets.all(AppDimensions.controlsPadding),
            child: Column(
              children: [
                // Main controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Previous letter
                    Tooltip(
                      message: AppStrings.tooltipPreviousLetter,
                      child: ElevatedButton(
                        onPressed: currentLetterIndex > 0
                            ? () async {
                                setState(() {
                                  currentLetterIndex--;
                                  points.clear();
                                });
                                await _soundService.playLetterSound(letters[currentLetterIndex]);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonPrevious,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.all(AppDimensions.buttonPaddingMain),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                          ),
                          elevation: AppDimensions.elevationMain,
                          shadowColor: AppColors.buttonPrevious.withOpacity(0.3),
                        ),
                        child: const Icon(Icons.arrow_back, size: AppDimensions.buttonIconSizeMain),
                      ),
                    ),
                    
                    // Next letter
                    Tooltip(
                      message: AppStrings.tooltipNextLetter,
                      child: ElevatedButton(
                        onPressed: currentLetterIndex < letters.length - 1
                            ? () async {
                                setState(() {
                                  currentLetterIndex++;
                                  points.clear();
                                });
                                await _soundService.playLetterSound(letters[currentLetterIndex]);
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonNext,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.all(AppDimensions.buttonPaddingMain),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimensions.radiusL),
                          ),
                          elevation: AppDimensions.elevationMain,
                          shadowColor: AppColors.buttonNext.withOpacity(0.3),
                        ),
                        child: const Icon(Icons.arrow_forward, size: AppDimensions.buttonIconSizeMain),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppDimensions.controlsSpacing),
                
                // Quick controls
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Jump to uppercase letters
                    Tooltip(
                      message: AppStrings.tooltipUppercaseLetters,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            currentLetterIndex = 0;
                            points.clear();
                          });
                          await _soundService.playLetterSound(letters[currentLetterIndex]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonUppercase,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.all(AppDimensions.buttonPaddingSecondary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                          ),
                          elevation: AppDimensions.elevationSecondary,
                        ),
                        child: const Icon(Icons.keyboard_arrow_up, size: AppDimensions.buttonIconSizeSecondary),
                      ),
                    ),
                    
                    // Jump to lowercase letters
                    Tooltip(
                      message: AppStrings.tooltipLowercaseLetters,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            currentLetterIndex = 26;
                            points.clear();
                          });
                          await _soundService.playLetterSound(letters[currentLetterIndex]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonLowercase,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.all(AppDimensions.buttonPaddingSecondary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                          ),
                          elevation: AppDimensions.elevationSecondary,
                        ),
                        child: const Icon(Icons.keyboard_arrow_down, size: AppDimensions.buttonIconSizeSecondary),
                      ),
                    ),
                    
                    // Random letter
                    Tooltip(
                      message: AppStrings.tooltipRandomLetter,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            // Generate random index that is not current
                            int newIndex;
                            do {
                              newIndex = Random().nextInt(letters.length);
                            } while (newIndex == currentLetterIndex);
                            currentLetterIndex = newIndex;
                            points.clear();
                          });
                          await _soundService.playLetterSound(letters[currentLetterIndex]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonRandom,
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.all(AppDimensions.buttonPaddingSecondary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppDimensions.radiusM),
                          ),
                          elevation: AppDimensions.elevationSecondary,
                        ),
                        child: const Icon(Icons.shuffle, size: AppDimensions.buttonIconSizeSecondary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for drawing
class DrawingPainter extends CustomPainter {
  final List<Offset> points;
  final Color penColor;
  final double penWidth;

  DrawingPainter(this.points, this.penColor, this.penWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = penColor
      ..strokeWidth = penWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != Offset.infinite && points[i + 1] != Offset.infinite) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
