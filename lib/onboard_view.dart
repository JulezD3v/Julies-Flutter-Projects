import 'package:flutter/material.dart';
import 'onboard_page.dart';

class OnboardView extends StatelessWidget {
  final OnboardPage page;
  final bool isWide;
  const OnboardView({required this.page, required this.isWide});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, c) {
        final vertical = c.maxWidth < 600;

        final art = Container(
          height: vertical ? 220 : 280,
          width: double.infinity,
          alignment: Alignment.center,
          child: Container(
            height: vertical ? 180 : 220,
            width: vertical ? 180 : 220,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  theme.colorScheme.primary.withOpacity(0.15),
                  theme.colorScheme.primary.withOpacity(0.05),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withOpacity(0.15),
                  blurRadius: 24,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(page.icon, size: vertical ? 96 : 120),
          ),
        );

        final text = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(page.title, style: theme.textTheme.headlineLarge),
            const SizedBox(height: 12),
            Text(page.description, style: theme.textTheme.bodyLarge),
          ],
        );

        if (vertical) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                art,
                const SizedBox(height: 8),
                text,
              ],
            ),
          );
        } else {
          return Row(
            children: [
              Expanded(child: art),
              const SizedBox(width: 24),
              Expanded(child: text),
            ],
          );
        }
      },
    );
  }
}
