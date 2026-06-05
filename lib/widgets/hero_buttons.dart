import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme/app_theme.dart';
import '../utils/download_helper.dart';
import '../utils/url_launcher_helper.dart';

class HeroPrimaryButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const HeroPrimaryButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<HeroPrimaryButton> createState() => _HeroPrimaryButtonState();
}

class _HeroPrimaryButtonState extends State<HeroPrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered ? const Color(0xFF8B85FF) : AppColors.accent,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withValues(alpha: _hovered ? 0.4 : 0.2),
                blurRadius: _hovered ? 20 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Icon(widget.icon, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSecondaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const HeroSecondaryButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<HeroSecondaryButton> createState() => _HeroSecondaryButtonState();
}

class _HeroSecondaryButtonState extends State<HeroSecondaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(color: AppColors.accent.withValues(alpha: 0.6)),
          ),
          child: Text(
            widget.label,
            style: TextStyle(fontFamily: 'Inter', 
              color: _hovered ? AppColors.accent : AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroIconLinkButton extends StatefulWidget {
  final dynamic icon;
  final String url;
  final String tooltip;
  final bool isMaterial;
  final bool isDownload;

  const HeroIconLinkButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
    this.isMaterial = false,
    this.isDownload = false,
  });

  @override
  State<HeroIconLinkButton> createState() => _HeroIconLinkButtonState();
}

class _HeroIconLinkButtonState extends State<HeroIconLinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: GestureDetector(
          onTap: () => widget.isDownload ? downloadFile(widget.url) : launchLink(widget.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.15)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _hovered
                    ? AppColors.accent.withValues(alpha: 0.5)
                    : AppColors.border,
              ),
            ),
            child: Center(
              child: widget.isMaterial
                  ? Icon(
                      widget.icon as IconData,
                      size: 18,
                      color: _hovered
                          ? AppColors.accent
                          : AppColors.textSecondary,
                    )
                  : FaIcon(
                      widget.icon as IconData,
                      size: 16,
                      color: _hovered
                          ? AppColors.accent
                          : AppColors.textSecondary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
