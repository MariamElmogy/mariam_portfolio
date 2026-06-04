import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String eyebrow;
  final String heading;

  const SectionTitle({
    super.key,
    required this.eyebrow,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              eyebrow.toUpperCase(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.accent,
                letterSpacing: 2.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Text(heading, style: theme.textTheme.displaySmall),
        const SizedBox(height: 48),
      ],
    );
  }
}
