import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_launcher_helper.dart';
import '../widgets/content_container.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMobile = MediaQuery.sizeOf(context).width < 768;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.background,
            AppColors.accent.withValues(alpha: 0.06),
          ],
        ),
        border: const Border(
          top: BorderSide(color: AppColors.border, width: 0.5),
        ),
      ),
      child: ContentContainer(
        bottomPadding: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            Text(
              "Let's Build Something Together",
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: isMobile ? 28 : 40,
                textBaseline: TextBaseline.alphabetic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Text(
                'Ready to bring your Flutter app idea to life? '
                "I'm open to full-time roles, freelance projects, "
                'and international remote opportunities.',
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),

            // Email button
            _EmailButton(),

            const SizedBox(height: 32),

            // Social links
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SocialIconButton(
                  icon: FontAwesomeIcons.github,
                  url: PortfolioData.githubUrl,
                  tooltip: 'GitHub',
                ),
                const SizedBox(width: 16),
                _SocialIconButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: PortfolioData.linkedinUrl,
                  tooltip: 'LinkedIn',
                ),
                const SizedBox(width: 16),
                _SocialIconButton(
                  icon: Icons.email_outlined,
                  url: 'mailto:${PortfolioData.email}',
                  tooltip: 'Email',
                  isMaterial: true,
                ),
                if (PortfolioData.resumeUrl.isNotEmpty) ...[
                  const SizedBox(width: 16),
                  _SocialIconButton(
                    icon: Icons.description_outlined,
                    url: PortfolioData.resumeUrl,
                    tooltip: 'Resume',
                    isMaterial: true,
                  ),
                ],
              ],
            ),

            const SizedBox(height: 56),

            // Divider
            Container(height: 0.5, color: AppColors.border),
            const SizedBox(height: 28),

            // Footer row
            Wrap(
              spacing: 24,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  '© 2025 Mariam Elmogy',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary.withValues(alpha: 0.7),
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Designed & built with ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary.withValues(alpha: 0.7),
                      ),
                    ),
                    Text(
                      'Flutter',
                      style: GoogleFonts.inter(
                        color: AppColors.accent.withValues(alpha: 0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailButton extends StatefulWidget {
  @override
  State<_EmailButton> createState() => _EmailButtonState();
}

class _EmailButtonState extends State<_EmailButton> {
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

class _SocialIconButton extends StatefulWidget {
  final dynamic icon;
  final String url;
  final String tooltip;
  final bool isMaterial;

  const _SocialIconButton({
    required this.icon,
    required this.url,
    required this.tooltip,
    this.isMaterial = false,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
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
                      color: _hovered
                          ? AppColors.accent
                          : AppColors.textSecondary,
                    )
                  : FaIcon(
                      widget.icon as IconData,
                      size: 18,
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
