import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import 'current_badge.dart';

class ExperienceCard extends StatefulWidget {
  final WorkExperience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = Responsive.isMobile(context);
    final hasBullets = widget.experience.bullets.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: widget.experience.isCurrent
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
                    if (widget.experience.isCurrent) ...[
                      const CurrentBadge(),
                      const SizedBox(height: 8),
                    ],
                    Text(widget.experience.role,
                        style: theme.textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(
                      widget.experience.period,
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
                        widget.experience.role,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.experience.period,
                          style: GoogleFonts.inter(
                            color: AppColors.accent.withValues(alpha: 0.9),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (widget.experience.isCurrent) ...[
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
                widget.experience.company,
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
              Text(widget.experience.location,
                  style: theme.textTheme.bodyMedium),
            ],
          ),
          const SizedBox(height: 12),
          Container(height: 0.5, color: AppColors.border),
          const SizedBox(height: 12),
          // Summary — always visible, max 5 lines when collapsed
          Text(
            widget.experience.summary,
            style: theme.textTheme.bodyMedium,
            maxLines: _expanded ? null : 5,
            overflow: _expanded ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
          // Bullets — only visible when expanded
          if (_expanded && hasBullets) ...[
            const SizedBox(height: 12),
            ...widget.experience.bullets.map(
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
          if (hasBullets) ...[
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  _expanded ? 'See less' : 'See more',
                  style: GoogleFonts.inter(
                    color: AppColors.accent,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
