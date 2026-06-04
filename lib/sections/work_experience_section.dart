import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/content_container.dart';
import '../widgets/section_title.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'Experience',
              heading: 'Where I\'ve Worked',
            ),
            _Timeline(experiences: PortfolioData.experiences),
          ],
        ),
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  final List<WorkExperience> experiences;

  const _Timeline({required this.experiences});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];
    for (var i = 0; i < experiences.length; i++) {
      final isLast = i == experiences.length - 1;
      items.add(_TimelineEntry(experience: experiences[i], isLast: isLast));
      if (!isLast) {
        // Vertical connector between entries
        items.add(
          Row(
            children: [
              SizedBox(
                width: 12,
                child: Center(
                  child: Container(
                    width: 2,
                    height: 28,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.accent.withValues(alpha: 0.4),
                          AppColors.border,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final WorkExperience experience;
  final bool isLast;

  const _TimelineEntry({required this.experience, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dot indicator
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: _Dot(isCurrent: experience.isCurrent),
        ),
        const SizedBox(width: 20),
        // Entry card
        Expanded(child: _EntryCard(experience: experience)),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isCurrent;

  const _Dot({required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isCurrent ? AppColors.accent : AppColors.surface,
        border: Border.all(
          color: AppColors.accent,
          width: isCurrent ? 0 : 2,
        ),
        boxShadow: isCurrent
            ? [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.35),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
    );
  }
}

class _EntryCard extends StatelessWidget {
  final WorkExperience experience;

  const _EntryCard({required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: experience.isCurrent
              ? AppColors.accent.withValues(alpha: 0.3)
              : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Role + period row
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (experience.isCurrent) ...[
                      _CurrentBadge(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          _CurrentBadge(),
                        ],
                      ],
                    ),
                  ],
                ),
          const SizedBox(height: 6),
          // Company + location
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
              Text(
                experience.location,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Divider
          Container(height: 0.5, color: AppColors.border),
          const SizedBox(height: 12),
          // Summary
          Text(experience.summary, style: theme.textTheme.bodyMedium),
          if (experience.bullets.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...experience.bullets.map(
              (bullet) => Padding(
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
                      child: Text(bullet, style: theme.textTheme.bodyMedium),
                    ),
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

class _CurrentBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.live.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.live.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.live,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            'Current',
            style: GoogleFonts.inter(
              color: AppColors.live,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
