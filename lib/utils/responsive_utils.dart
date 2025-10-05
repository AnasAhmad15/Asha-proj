import 'package:flutter/material.dart';

class ResponsiveUtils {
  static const double _baseWidth = 375.0; // Standard mobile width
  static const double _baseHeight = 667.0; // Standard mobile height

  static double width(BuildContext context) => MediaQuery.of(context).size.width;
  static double height(BuildContext context) => MediaQuery.of(context).size.height;

  // Scale factors for responsive design
  static double scaleWidth(BuildContext context, double size) {
    return size * (width(context) / _baseWidth);
  }

  static double scaleHeight(BuildContext context, double size) {
    return size * (height(context) / _baseHeight);
  }

  static double scaleFont(BuildContext context, double size) {
    final scaleFactor = (width(context) / _baseWidth + height(context) / _baseHeight) / 2;
    return size * scaleFactor;
  }

  // Common responsive sizes - these need context passed in
  static double cardPadding(BuildContext context) => scaleWidth(context, 20);
  static double cardMargin(BuildContext context) => scaleWidth(context, 8);
  static double buttonHeight(BuildContext context) => scaleHeight(context, 48);
  static double buttonWidth(BuildContext context) => scaleWidth(context, 120);
  static double iconSize(BuildContext context) => scaleWidth(context, 24);
  static double avatarRadius(BuildContext context) => scaleWidth(context, 32);

  // Responsive text sizes - these need context passed in
  static double displayLarge(BuildContext context) => scaleFont(context, 32);
  static double displayMedium(BuildContext context) => scaleFont(context, 28);
  static double headlineMedium(BuildContext context) => scaleFont(context, 20);
  static double titleLarge(BuildContext context) => scaleFont(context, 18);
  static double bodyLarge(BuildContext context) => scaleFont(context, 16);
  static double bodyMedium(BuildContext context) => scaleFont(context, 14);

  // Responsive padding and margins - these need context passed in
  static EdgeInsets cardPaddingAll(BuildContext context) => EdgeInsets.all(cardPadding(context));
  static EdgeInsets cardMarginAll(BuildContext context) => EdgeInsets.all(cardMargin(context));
  static EdgeInsets screenPadding(BuildContext context) => EdgeInsets.symmetric(
    horizontal: scaleWidth(context, 16),
    vertical: scaleHeight(context, 16),
  );

  // Check device type
  static bool isTablet(BuildContext context) => width(context) > 600;
  static bool isLargeScreen(BuildContext context) => width(context) > 900;

  // Adaptive sizing based on screen size
  static double adaptiveSize(BuildContext context, double small, double medium, double large) {
    if (isLargeScreen(context)) return large;
    if (isTablet(context)) return medium;
    return small;
  }

  // Responsive grid columns
  static int getGridColumns(BuildContext context) {
    if (isLargeScreen(context)) return 4;
    if (isTablet(context)) return 3;
    return 2;
  }

  // Responsive aspect ratio for cards
  static double getCardAspectRatio(BuildContext context) {
    if (isLargeScreen(context)) return 1.5;
    if (isTablet(context)) return 1.2;
    return 1.0;
  }
}

// Extension for easier access
extension ResponsiveExtension on BuildContext {
  double get screenWidth => ResponsiveUtils.width(this);
  double get screenHeight => ResponsiveUtils.height(this);

  bool get isTablet => ResponsiveUtils.isTablet(this);
  bool get isLargeScreen => ResponsiveUtils.isLargeScreen(this);

  double scaleWidth(double size) => ResponsiveUtils.scaleWidth(this, size);
  double scaleHeight(double size) => ResponsiveUtils.scaleHeight(this, size);
  double scaleFont(double size) => ResponsiveUtils.scaleFont(this, size);
}
