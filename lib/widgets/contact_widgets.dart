import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/download_helper.dart';
import '../utils/url_launcher_helper.dart';

class ContactEmailButton extends StatelessWidget {
  const ContactEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _ContactCard(
      iconColor: AppColors.accent,
      icon: Icons.email_outlined,
      isMaterialIcon: true,
      title: 'Email Me',
      subtitle: PortfolioData.email,
      onTap: () => launchEmail(PortfolioData.email),
    );
  }
}

class ContactWhatsAppButton extends StatelessWidget {
  const ContactWhatsAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return _ContactCard(
      iconColor: const Color(0xFF25D366),
      icon: FontAwesomeIcons.whatsapp,
      isMaterialIcon: false,
      title: 'WhatsApp',
      subtitle: "Let's chat directly",
      onTap: () => launchLink(
          'https://wa.me/${PortfolioData.whatsappNumber.replaceAll('+', '')}'),
    );
  }
}

class _ContactCard extends StatefulWidget {
  final Color iconColor;
  final dynamic icon;
  final bool isMaterialIcon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactCard({
    required this.iconColor,
    required this.icon,
    required this.isMaterialIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
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
          width: 260,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 32),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.card
                : AppColors.card.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? widget.iconColor.withValues(alpha: 0.5)
                  : AppColors.border,
              width: 1.5,
            ),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: widget.iconColor.withValues(alpha: 0.12),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Circular icon
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: widget.iconColor.withValues(alpha: _hovered ? 0.25 : 0.15),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: widget.isMaterialIcon
                      ? Icon(widget.icon as IconData,
                          size: 24, color: widget.iconColor)
                      : FaIcon(widget.icon as IconData,
                          size: 22, color: widget.iconColor),
                ),
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                widget.title,
                style: TextStyle(fontFamily: 'Inter',
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              // Subtitle
              Text(
                widget.subtitle,
                style: TextStyle(fontFamily: 'Inter',
                  color: AppColors.textSecondary.withValues(alpha: 0.7),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
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
  final bool isDownload;

  const ContactSocialButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
    this.isMaterial = false,
    this.isDownload = false,
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
          onTap: () => widget.isDownload ? downloadFile(widget.url) : launchLink(widget.url),
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
