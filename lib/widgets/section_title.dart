import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SectionTitle extends StatelessWidget {
  final String eyebrow;
  final String prefix;
  final String highlight;
  final String? subtitle;

  const SectionTitle({
    super.key,
    required this.eyebrow,
    this.prefix = '',
    required this.highlight,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            eyebrow.toUpperCase(),
            style: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.accent,
              letterSpacing: 2.5,
            ),
          ), //   Row(
          //   children: [
          //     Container(
          //       width: 3,
          //       height: 18,
          //       decoration: BoxDecoration(
          //         color: AppColors.accent,
          //         borderRadius: BorderRadius.circular(2),
          //       ),
          //     ),
          //     const SizedBox(width: 10),
          //     Text(
          //       eyebrow.toUpperCase(),
          //       style: theme.textTheme.labelMedium?.copyWith(
          //         color: AppColors.accent,
          //         letterSpacing: 2.5,
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 14),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: theme.textTheme.displaySmall,
              children: [
                if (prefix.isNotEmpty) TextSpan(text: '$prefix '),
                TextSpan(
                  text: highlight,
                  style: const TextStyle(color: AppColors.accent),
                ),
              ],
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 12),
            Text(
              subtitle!,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: 52),
        ],
      ),
    );
  }
}
