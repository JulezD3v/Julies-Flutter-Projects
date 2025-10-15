import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontWeight: FontWeight.w700),
          headlineMedium: TextStyle(fontWeight: FontWeight.w700),
          bodyLarge: TextStyle(height: 1.4),
        ),
      ),
      home: const OnboardingScreen(),
    );
  }
}

