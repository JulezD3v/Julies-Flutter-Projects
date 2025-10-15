import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // Update this to the correct file where OnboardingScreen is defined

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const OnboardingScreen()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.home_outlined, size: 72),
            const SizedBox(height: 12),
            Text(
              'You\'re in! This is a placeholder home screen.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                );
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Onboarding'),
            ),
          ],
        ),
      ),
    );
  }
}
