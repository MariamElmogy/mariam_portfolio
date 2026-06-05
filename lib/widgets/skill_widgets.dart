import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

class SkillRow extends StatelessWidget {
  final SkillGroup group;

  const SkillRow({super.key, required this.group});

  IconData get _icon => switch (group.title) {
        'Languages' => Icons.code_rounded,
        'Mobile & Flutter' => Icons.phone_android_rounded,
        'Architecture' => Icons.account_tree_rounded,
        'Teaching & Training' => Icons.school_rounded,
        _ => Icons.build_rounded,
      };

  Color get _color => switch (group.title) {
        'Languages' => AppColors.orange,
        'Mobile & Flutter' => AppColors.cyan,
        'Architecture' => AppColors.live,
        _ => AppColors.accent,
      };

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final color = _color;
    final label = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color.withValues(alpha: 0.25)),
          ),
          child: Icon(_icon, size: 20, color: color),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            group.title,
            style: TextStyle(fontFamily: 'Poppins',
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );

    final chips = Wrap(
      spacing: 8,
      runSpacing: 8,
      children: group.skills.map((s) => SkillChip(label: s)).toList(),
    );

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [label, const SizedBox(height: 16), chips],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 200, child: label),
        const SizedBox(width: 32),
        Expanded(child: chips),
      ],
    );
  }
}

class SkillChip extends StatefulWidget {
  final String label;
  const SkillChip({super.key, required this.label});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
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
          style: TextStyle(fontFamily: 'Inter',
            color: _hovered ? AppColors.accent : AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
