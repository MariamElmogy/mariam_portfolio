import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/content_container.dart';
import '../widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              eyebrow: 'Skills',
              heading: 'Technologies I Use',
            ),
            Column(
              children: [
                for (var i = 0; i < PortfolioData.skillGroups.length; i++) ...[
                  _SkillRow(group: PortfolioData.skillGroups[i]),
                  if (i < PortfolioData.skillGroups.length - 1)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 28),
                      child: Divider(color: AppColors.border, height: 1),
                    ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final SkillGroup group;

  const _SkillRow({required this.group});

  IconData get _icon => switch (group.title) {
        'Languages' => Icons.code_rounded,
        'Mobile & Flutter' => Icons.phone_android_rounded,
        'Architecture' => Icons.account_tree_rounded,
        _ => Icons.build_rounded,
      };

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final label = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
          ),
          child: Icon(_icon, size: 20, color: AppColors.accent),
        ),
        const SizedBox(width: 12),
        Text(
          group.title,
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );

    final chips = Wrap(
      spacing: 8,
      runSpacing: 8,
      children: group.skills.map((s) => _SkillChip(s)).toList(),
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          label,
          const SizedBox(height: 16),
          chips,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: label,
          ),
        ),
        const SizedBox(width: 32),
        Expanded(child: chips),
      ],
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String label;
  const _SkillChip(this.label);

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.accent.withValues(alpha: 0.15)
              : AppColors.accent.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.5)
                : AppColors.accent.withValues(alpha: 0.18),
          ),
        ),
        child: Text(
          widget.label,
          style: GoogleFonts.inter(
            color: _hovered ? AppColors.accent : AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
