import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_launcher_helper.dart';

class ContactEmailButton extends StatefulWidget {
  const ContactEmailButton({super.key});

  @override
  State<ContactEmailButton> createState() => _ContactEmailButtonState();
}

class _ContactEmailButtonState extends State<ContactEmailButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchEmail(PortfolioData.email),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent
                  : AppColors.accent.withValues(alpha: 0.5),
              width: 1.5,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.email_outlined,
                size: 18,
                color: _hovered ? Colors.white : AppColors.accent,
              ),
              const SizedBox(width: 10),
              Text(
                PortfolioData.email,
                style: GoogleFonts.inter(
                  color: _hovered ? Colors.white : AppColors.accent,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactSocialButton extends StatefulWidget {
  final dynamic icon;
  final String url;
  final String tooltip;
  final bool isMaterial;

  const ContactSocialButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
    this.isMaterial = false,
  });

  @override
  State<ContactSocialButton> createState() => _ContactSocialButtonState();
}

class _ContactSocialButtonState extends State<ContactSocialButton> {
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
          onTap: () => launchLink(widget.url),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.accent.withValues(alpha: 0.15)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(12),
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
                      size: 20,
                      color:
                          _hovered ? AppColors.accent : AppColors.textSecondary,
                    )
                  : FaIcon(
                      widget.icon as IconData,
                      size: 18,
                      color:
                          _hovered ? AppColors.accent : AppColors.textSecondary,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
