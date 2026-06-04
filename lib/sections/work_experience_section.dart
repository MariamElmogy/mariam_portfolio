import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/content_container.dart';
import '../widgets/experience_card.dart';
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
        Expanded(child: ExperienceCard(experience: experience)),
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
