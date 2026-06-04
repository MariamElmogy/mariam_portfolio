import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import 'current_badge.dart';

class ExperienceCard extends StatelessWidget {
  final WorkExperience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: experience.isCurrent
              ? AppColors.accent.withValues(alpha: 0.3)
              : AppColors.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (experience.isCurrent) ...[
                      const CurrentBadge(),
                      const SizedBox(height: 8),
                    ],
                    Text(experience.role, style: theme.textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(
                      experience.period,
                      style: GoogleFonts.inter(
                        color: AppColors.accent.withValues(alpha: 0.9),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        experience.role,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          experience.period,
                          style: GoogleFonts.inter(
                            color: AppColors.accent.withValues(alpha: 0.9),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (experience.isCurrent) ...[
                          const SizedBox(width: 10),
                          const CurrentBadge(),
                        ],
                      ],
                    ),
                  ],
                ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                experience.company,
                style: GoogleFonts.inter(
                  color: AppColors.textPrimary.withValues(alpha: 0.85),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  width: 3,
                  height: 3,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              Text(experience.location, style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 12),
          Container(height: 0.5, color: AppColors.border),
          const SizedBox(height: 12),
          Text(experience.summary, style: theme.textTheme.bodyMedium),
          if (experience.bullets.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...experience.bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.accent.withValues(alpha: 0.7),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Text(b, style: theme.textTheme.bodyMedium)),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
