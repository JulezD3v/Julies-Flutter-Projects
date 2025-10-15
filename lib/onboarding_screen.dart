import 'package:flutter/material.dart';
import 'onboard_page.dart';
import 'onboard_view.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _current = 0;

  final List<OnboardPage> _pages = const [
    OnboardPage(
      icon: Icons.public,
      title: 'Welcome',
      description:
          'Discover a clean, 3-page onboarding built in pure Flutter — no packages required.',
    ),
    OnboardPage(
      icon: Icons.bolt,
      title: 'Fast & Simple',
      description:
          'Built with PageView, Animated dots, and responsive layout that works on any screen.',
    ),
    OnboardPage(
      icon: Icons.thumb_up_alt_outlined,
      title: 'You\'re Ready',
      description:
          'Tap Get Started to continue to the app. Feel free to tweak styles and copy.',
    ),
  ];

  void _goTo(int index) {
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOut,
    );
  }

  void _next() {
    if (_current < _pages.length - 1) {
      _goTo(_current + 1);
    } else {
      _finish();
    }
  }

  void _skip() => _goTo(_pages.length - 1);

  void _finish() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWide = size.width > 700;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Skip button
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: _skip,
                  child: const Text('Skip'),
                ),
              ),

              // PageView section
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (i) => setState(() => _current = i),
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    final page = _pages[index];
                    return OnboardView(page: page, isWide: isWide);
                  },
                ),
              ),

              // Dots + Next/Get Started button
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      _pages.length,
                      (i) => AnimatedContainer(
                        duration: const Duration(milliseconds: 240),
                        margin: const EdgeInsets.only(right: 8),
                        height: 10,
                        width: _current == i ? 28 : 10,
                        decoration: BoxDecoration(
                          color: _current == i
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: _next,
                    child: Text(
                        _current == _pages.length - 1 ? 'Get Started' : 'Next'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
