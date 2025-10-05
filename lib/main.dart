import 'package:flutter/material.dart';
import 'package:morse_proj/screens/splash_screen.dart';
import 'package:morse_proj/theme/app_theme.dart';

void main() {
  runApp(const AshaEhrApp());
}

class AshaEhrApp extends StatelessWidget {
  const AshaEhrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASHA EHR Companion',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        // Handle custom route transitions here if needed
        return null;
      },
    );
  }
}
