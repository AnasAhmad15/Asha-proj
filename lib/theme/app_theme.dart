import 'package:flutter/material.dart';

class AppTheme {
  // Color palette - soft modern colors for accessibility
  static const Color primaryBlue = Color(0xFF4A90E2);
  static const Color secondaryGreen = Color(0xFF7ED321);
  static const Color accentTeal = Color(0xFF50E3C2);
  static const Color backgroundWhite = Color(0xFFFAFAFA);
  static const Color cardWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF2C3E50);
  static const Color textLight = Color(0xFF7F8C8D);
  static const Color errorRed = Color(0xFFE74C3C);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.light(
        primary: primaryBlue,
        secondary: secondaryGreen,
        tertiary: accentTeal,
        surface: cardWhite,
        error: errorRed,
      ),
      scaffoldBackgroundColor: backgroundWhite,

      // Typography - large and readable for accessibility
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textDark,
        ),
        displaySmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textDark,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: textDark,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: textDark,
          height: 1.5, // Better readability
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: textLight,
          height: 1.4,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),

      // Card theme - rounded corners for modern look
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: cardWhite,
        margin: const EdgeInsets.all(8),
      ),

      // Elevated button theme - large accessible buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          elevation: 3,
          minimumSize: const Size(120, 48), // Minimum touch target size
        ),
      ),

      // App bar theme with rounded bottom corners
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),

      // Input decoration theme for consistent form fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: textLight.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: textLight.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        labelStyle: const TextStyle(color: textLight),
        hintStyle: const TextStyle(color: textLight),
      ),

      // Icon theme for consistent icon sizing
      iconTheme: const IconThemeData(
        size: 24,
        color: textDark,
      ),

      // Floating action button theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: errorRed,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: cardWhite,
        selectedItemColor: accentTeal,
        unselectedItemColor: textLight,
        elevation: 8,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      // Visual density for better touch targets
      visualDensity: VisualDensity.adaptivePlatformDensity,

      // Page transitions theme for smooth animations
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      // Dialog theme for consistent styling
      dialogTheme: DialogThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 8,
      ),

      // Chip theme for tags and labels
      chipTheme: ChipThemeData(
        backgroundColor: primaryBlue.withOpacity(0.1),
        selectedColor: primaryBlue,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: const TextStyle(
          color: primaryBlue,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Progress indicator theme
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryBlue,
        linearTrackColor: Colors.grey,
      ),

      // Slider theme for interactive elements
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryBlue,
        inactiveTrackColor: primaryBlue.withOpacity(0.3),
        thumbColor: primaryBlue,
        overlayColor: primaryBlue.withOpacity(0.2),
        valueIndicatorColor: primaryBlue,
      ),

      // Switch theme for toggles
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return Colors.grey;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue.withOpacity(0.5);
          }
          return Colors.grey.withOpacity(0.5);
        }),
      ),

      // Radio theme for selection controls
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return textLight;
        }),
      ),

      // Checkbox theme for selection controls
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryBlue;
          }
          return textLight;
        }),
      ),

      // List tile theme for consistent list styling
      listTileTheme: const ListTileThemeData(
        tileColor: cardWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),

      // Tooltip theme for helpful hints
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: textDark.withOpacity(0.9),
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),

      // Snack bar theme for notifications
      snackBarTheme: SnackBarThemeData(
        backgroundColor: textDark,
        contentTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Text selection theme for better UX
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryBlue,
        selectionColor: primaryBlue.withOpacity(0.3),
        selectionHandleColor: primaryBlue,
      ),

      // Scrollbar theme for better scrolling experience
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(textLight),
        trackColor: MaterialStateProperty.all(textLight.withOpacity(0.3)),
        radius: const Radius.circular(8),
      ),

      // Menu theme for popup menus
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 8,
        color: cardWhite,
      ),

      // Bottom sheet theme for modal screens
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        elevation: 8,
        backgroundColor: cardWhite,
      ),
    );
  }
}
