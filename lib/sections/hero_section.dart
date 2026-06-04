import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../utils/url_launcher_helper.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Animation<double> _fadeAt(double start, double end) => CurvedAnimation(
        parent: _ctrl,
        curve: Interval(start, end, curve: Curves.easeOut),
      );

  Animation<Offset> _slideAt(double start, double end) =>
      Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero).animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: Interval(start, end, curve: Curves.easeOutCubic),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final size = MediaQuery.sizeOf(context);

    return Container(
      constraints: BoxConstraints(minHeight: size.height * 0.92),
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-1.2, -1.0),
          radius: 1.4,
          colors: [
            AppColors.accent.withValues(alpha: 0.14),
            AppColors.background,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 60,
              vertical: 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Available badge
                FadeTransition(
                  opacity: _fadeAt(0.0, 0.4),
                  child: SlideTransition(
                    position: _slideAt(0.0, 0.45),
                    child: _AvailableBadge(),
                  ),
                ),
                const SizedBox(height: 28),

                // Name
                FadeTransition(
                  opacity: _fadeAt(0.1, 0.55),
                  child: SlideTransition(
                    position: _slideAt(0.1, 0.55),
                    child: Text(
                      'Mariam Elmogy',
                      style:
                          (isMobile
                              ? Theme.of(context).textTheme.displayMedium
                              : Theme.of(context).textTheme.displayLarge)
                              ?.copyWith(
                        fontSize: isMobile ? 40 : 68,
                      ),
                    ),
                  ),
                ),

                // Title
                FadeTransition(
                  opacity: _fadeAt(0.2, 0.6),
                  child: SlideTransition(
                    position: _slideAt(0.2, 0.6),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [AppColors.accent, AppColors.accentLight],
                      ).createShader(bounds),
                      child: Text(
                        'Flutter Developer',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: isMobile ? 24 : 36,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Bio
                FadeTransition(
                  opacity: _fadeAt(0.3, 0.7),
                  child: SlideTransition(
                    position: _slideAt(0.3, 0.7),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 620),
                      child: Text(
                        'Flutter developer with 2+ years building and shipping '
                        'cross-platform mobile apps. Currently the sole Flutter '
                        'developer at Leggera Techs, owning four production apps '
                        'end-to-end — architecture, development, testing, and '
                        'App Store / Google Play release.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontSize: isMobile ? 15 : 17,
                            ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Location chip
                FadeTransition(
                  opacity: _fadeAt(0.35, 0.72),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: AppColors.accent.withValues(alpha: 0.8),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Alexandria, Egypt',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary.withValues(alpha: 0.9),
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // CTA Buttons
                FadeTransition(
                  opacity: _fadeAt(0.45, 0.85),
                  child: SlideTransition(
                    position: _slideAt(0.45, 0.85),
                    child: isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _PrimaryButton(
                                label: 'View My Work',
                                icon: Icons.arrow_downward_rounded,
                                onTap: () {},
                              ),
                              const SizedBox(height: 12),
                              _SecondaryButton(
                                label: 'Get In Touch',
                                onTap: () =>
                                    launchEmail(PortfolioData.email),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  _IconLinkButton(
                                    icon: FontAwesomeIcons.github,
                                    url: PortfolioData.githubUrl,
                                    tooltip: 'GitHub',
                                  ),
                                  const SizedBox(width: 12),
                                  _IconLinkButton(
                                    icon: FontAwesomeIcons.linkedin,
                                    url: PortfolioData.linkedinUrl,
                                    tooltip: 'LinkedIn',
                                  ),
                                  if (PortfolioData.resumeUrl.isNotEmpty) ...[
                                    const SizedBox(width: 12),
                                    _IconLinkButton(
                                      icon: Icons.description_outlined,
                                      url: PortfolioData.resumeUrl,
                                      tooltip: 'Resume',
                                      isMaterial: true,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          )
                        : Wrap(
                            spacing: 14,
                            runSpacing: 14,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              _PrimaryButton(
                                label: 'View My Work',
                                icon: Icons.arrow_downward_rounded,
                                onTap: () {},
                              ),
                              _SecondaryButton(
                                label: 'Get In Touch',
                                onTap: () =>
                                    launchEmail(PortfolioData.email),
                              ),
                              _IconLinkButton(
                                icon: FontAwesomeIcons.github,
                                url: PortfolioData.githubUrl,
                                tooltip: 'GitHub',
                              ),
                              _IconLinkButton(
                                icon: FontAwesomeIcons.linkedin,
                                url: PortfolioData.linkedinUrl,
                                tooltip: 'LinkedIn',
                              ),
                              _IconLinkButton(
                                icon: Icons.download_rounded,
                                url: PortfolioData.resumeUrl,
                                tooltip: 'Download CV',
                                isMaterial: true,
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AvailableBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.live.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.live.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppColors.live,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Available for new opportunities',
            style: GoogleFonts.inter(
              color: AppColors.live,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _PrimaryButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<_PrimaryButton> {
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
                ? const Color(0xFF8B85FF)
                : AppColors.accent,
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
                style: GoogleFonts.inter(
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

class _SecondaryButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const _SecondaryButton({required this.label, required this.onTap});

  @override
  State<_SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<_SecondaryButton> {
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
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.6)),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
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

class _IconLinkButton extends StatefulWidget {
  final dynamic icon;
  final String url;
  final String tooltip;
  final bool isMaterial;

  const _IconLinkButton({
    required this.icon,
    required this.url,
    required this.tooltip,
    this.isMaterial = false,
  });

  @override
  State<_IconLinkButton> createState() => _IconLinkButtonState();
}

class _IconLinkButtonState extends State<_IconLinkButton> {
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
