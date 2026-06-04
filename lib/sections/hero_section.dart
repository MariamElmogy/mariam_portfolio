import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../utils/url_launcher_helper.dart';
import '../widgets/available_badge.dart';
import '../widgets/hero_buttons.dart';

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
                    child: const AvailableBadge(),
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
                              HeroPrimaryButton(
                                label: 'View My Work',
                                icon: Icons.arrow_downward_rounded,
                                onTap: () {},
                              ),
                              const SizedBox(height: 12),
                              HeroSecondaryButton(
                                label: 'Get In Touch',
                                onTap: () =>
                                    launchEmail(PortfolioData.email),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  HeroIconLinkButton(
                                    icon: FontAwesomeIcons.github,
                                    url: PortfolioData.githubUrl,
                                    tooltip: 'GitHub',
                                  ),
                                  const SizedBox(width: 12),
                                  HeroIconLinkButton(
                                    icon: FontAwesomeIcons.linkedin,
                                    url: PortfolioData.linkedinUrl,
                                    tooltip: 'LinkedIn',
                                  ),
                                  if (PortfolioData.resumeUrl.isNotEmpty) ...[
                                    const SizedBox(width: 12),
                                    HeroIconLinkButton(
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
                              HeroPrimaryButton(
                                label: 'View My Work',
                                icon: Icons.arrow_downward_rounded,
                                onTap: () {},
                              ),
                              HeroSecondaryButton(
                                label: 'Get In Touch',
                                onTap: () =>
                                    launchEmail(PortfolioData.email),
                              ),
                              HeroIconLinkButton(
                                icon: FontAwesomeIcons.github,
                                url: PortfolioData.githubUrl,
                                tooltip: 'GitHub',
                              ),
                              HeroIconLinkButton(
                                icon: FontAwesomeIcons.linkedin,
                                url: PortfolioData.linkedinUrl,
                                tooltip: 'LinkedIn',
                              ),
                              HeroIconLinkButton(
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
