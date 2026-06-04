import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/content_container.dart';
import '../widgets/experience_card.dart';
import '../widgets/section_title.dart';

class WorkExperienceSection extends StatelessWidget {
  const WorkExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: AppColors.background,
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'Career',
              prefix: 'Professional',
              highlight: 'Journey',
              subtitle: 'My career timeline and educational background.',
            ),
            isMobile
                ? _buildMobileLayout(context)
                : _buildDesktopLayout(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: _ExperienceColumn(),
        ),
        const SizedBox(width: 40),
        Expanded(
          flex: 2,
          child: _EducationColumn(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ExperienceColumn(),
        const SizedBox(height: 40),
        _EducationColumn(),
      ],
    );
  }
}

// ─── Left column: work timeline ───────────────────────────────────────────────

class _ExperienceColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColumnHeader(
          icon: Icons.work_outline_rounded,
          label: 'Work Experience',
          color: AppColors.accent,
        ),
        const SizedBox(height: 20),
        _Timeline(experiences: PortfolioData.experiences),
      ],
    );
  }
}

// ─── Right column: education + certs + awards ──────────────────────────────────

class _EducationColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ColumnHeader(
          icon: Icons.school_outlined,
          label: 'Education',
          color: AppColors.cyan,
        ),
        const SizedBox(height: 20),
        ...PortfolioData.education.map(
          (edu) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.border),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          edu.degree,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        edu.period,
                        style: GoogleFonts.inter(
                          color: AppColors.cyan,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(edu.institution, style: theme.textTheme.bodyMedium),
                  if (edu.detail != null) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.cyan.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: AppColors.cyan.withValues(alpha: 0.2)),
                      ),
                      child: Text(
                        edu.detail!,
                        style: GoogleFonts.inter(
                          color: AppColors.cyan,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 28),
        _ColumnHeader(
          icon: Icons.workspace_premium_outlined,
          label: 'Certifications',
          color: AppColors.orange,
        ),
        const SizedBox(height: 16),
        ...PortfolioData.certifications.map(
          (cert) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.orange.withValues(alpha: 0.2),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.orange.withValues(alpha: 0.25),
                      ),
                    ),
                    child: Icon(
                      Icons.workspace_premium_rounded,
                      size: 18,
                      color: AppColors.orange,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cert.title,
                          style: GoogleFonts.poppins(
                            color: AppColors.textPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${cert.issuer} · ${cert.year}',
                          style: GoogleFonts.inter(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      cert.year,
                      style: GoogleFonts.inter(
                        color: AppColors.orange,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (PortfolioData.awards.isNotEmpty) ...[
          const SizedBox(height: 28),
          _ColumnHeader(
            icon: Icons.emoji_events_outlined,
            label: 'Awards',
            color: AppColors.freelance,
          ),
          const SizedBox(height: 16),
          ...PortfolioData.awards.map(
            (award) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.border),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.emoji_events_outlined,
                      size: 18,
                      color: AppColors.freelance.withValues(alpha: 0.7)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(award,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }
}

// ─── Shared column header ──────────────────────────────────────────────────────

class _ColumnHeader extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _ColumnHeader({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withValues(alpha: 0.2)),
          ),
          child: Icon(icon, size: 18, color: color),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

// ─── Timeline ──────────────────────────────────────────────────────────────────

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
        items.add(
          Row(
            children: [
              SizedBox(
                width: 12,
                child: Center(
                  child: Container(
                    width: 2,
                    height: 24,
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
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: _Dot(isCurrent: experience.isCurrent),
        ),
        const SizedBox(width: 20),
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
