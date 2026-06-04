import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'card_link_button.dart';
import 'project_image_placeholder.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  Color get _statusColor => switch (widget.project.status) {
        ProjectStatus.live => AppColors.live,
        ProjectStatus.production => AppColors.production,
        ProjectStatus.freelance => AppColors.freelance,
        ProjectStatus.openSource => AppColors.openSource,
      };

  String get _statusLabel => switch (widget.project.status) {
        ProjectStatus.live => 'Live',
        ProjectStatus.production => 'Production',
        ProjectStatus.freelance => 'Freelance',
        ProjectStatus.openSource => 'Open Source',
      };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final statusColor = _statusColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.basic,
      child: AnimatedScale(
        scale: _hovered ? 1.015 : 1.0,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: _hovered ? AppColors.cardHover : AppColors.card,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.4)
                  : AppColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _hovered ? 0.0 : 0.06),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: AppColors.accent.withValues(alpha: _hovered ? 0.12 : 0.0),
                blurRadius: 28,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProjectImagePlaceholder(
                status: widget.project.status,
                statusColor: statusColor,
                imageUrl: widget.project.imageUrl,
              ),
              // Card body
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: statusColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: statusColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            _statusLabel,
                            style: GoogleFonts.inter(
                              color: statusColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Title
                    Text(
                      widget.project.title,
                      style: theme.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    // Description
                    Text(
                      widget.project.description,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),
                    // Tech tags
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: widget.project.techTags
                          .map(
                            (tag) => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.accent.withValues(alpha: 0.08),
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color:
                                      AppColors.accent.withValues(alpha: 0.2),
                                ),
                              ),
                              child: Text(
                                tag,
                                style: GoogleFonts.inter(
                                  color:
                                      AppColors.accent.withValues(alpha: 0.9),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    // Always-present badge row (keeps all card heights equal)
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 54,
                      child: widget.project.hasLinks
                          ? Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                if (widget.project.appStoreUrl != null)
                                  AppStoreBadge(
                                      url: widget.project.appStoreUrl!),
                                if (widget.project.playStoreUrl != null)
                                  PlayStoreBadge(
                                      url: widget.project.playStoreUrl!),
                                if (widget.project.githubUrl != null)
                                  CardLinkButton(
                                    url: widget.project.githubUrl!,
                                    label: 'View Source',
                                  ),
                                if (widget.project.websiteUrl != null)
                                  CardLinkButton(
                                    url: widget.project.websiteUrl!,
                                    label: 'View Project',
                                  ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
