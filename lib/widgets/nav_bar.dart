import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../utils/download_helper.dart';
import '../utils/url_launcher_helper.dart';

class NavBar extends StatefulWidget {
  final VoidCallback onHeroTap;
  final VoidCallback onAboutTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onHeroTap,
    required this.onAboutTap,
    required this.onExperienceTap,
    required this.onProjectsTap,
    required this.onSkillsTap,
    required this.onContactTap,
  });

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _menuOpen = false;

  void _handleNavTap(VoidCallback callback) {
    if (_menuOpen) setState(() => _menuOpen = false);
    callback();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Container(
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xD9FAFAFA),
                border: Border(
                  bottom: BorderSide(color: AppColors.border, width: 0.5),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 60,
                ),
                child: Row(
                  children: [
                    _Logo(onTap: widget.onHeroTap),
                    const Spacer(),
                    if (isMobile)
                      IconButton(
                        icon: Icon(
                          _menuOpen
                              ? Icons.close_rounded
                              : Icons.menu_rounded,
                          color: AppColors.textPrimary,
                          size: 24,
                        ),
                        onPressed: () =>
                            setState(() => _menuOpen = !_menuOpen),
                      )
                    else ...[
                      _NavLink('About', () =>
                          _handleNavTap(widget.onAboutTap)),
                      _NavLink('Experience', () =>
                          _handleNavTap(widget.onExperienceTap)),
                      _NavLink('Projects', () =>
                          _handleNavTap(widget.onProjectsTap)),
                      _NavLink('Skills', () =>
                          _handleNavTap(widget.onSkillsTap)),
                      _NavLink('Contact', () =>
                          _handleNavTap(widget.onContactTap)),
                      const SizedBox(width: 20),
                      _GitHubButton(),
                      const SizedBox(width: 10),
                      _ResumeButton(),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
        // Mobile dropdown
        if (isMobile)
          AnimatedSize(
            duration: const Duration(milliseconds: 280),
            curve: Curves.easeInOut,
            child: _menuOpen
                ? Container(
                    width: double.infinity,
                    color: AppColors.surface,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        _MobileNavLink('About', () =>
                            _handleNavTap(widget.onAboutTap)),
                        _MobileNavLink('Experience', () =>
                            _handleNavTap(widget.onExperienceTap)),
                        _MobileNavLink('Projects', () =>
                            _handleNavTap(widget.onProjectsTap)),
                        _MobileNavLink('Skills', () =>
                            _handleNavTap(widget.onSkillsTap)),
                        _MobileNavLink('Contact', () =>
                            _handleNavTap(widget.onContactTap)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
                          child: _GitHubButton(fullWidth: true),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                          child: _ResumeButton(fullWidth: true),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(width: double.infinity, height: 0),
          ),
      ],
    );
  }
}

class _Logo extends StatefulWidget {
  final VoidCallback onTap;
  const _Logo({required this.onTap});

  @override
  State<_Logo> createState() => _LogoState();
}

class _LogoState extends State<_Logo> {
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
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.accent,
                AppColors.accent.withValues(alpha: 0.75),
              ],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.45),
                      blurRadius: 14,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: const Center(
            child: Text(
              'M',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: _hovered ? AppColors.accent : AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _hovered ? widget.label.length * 7.5 : 0,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobileNavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _MobileNavLink(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _ResumeButton extends StatefulWidget {
  final bool fullWidth;
  const _ResumeButton({this.fullWidth = false});

  @override
  State<_ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<_ResumeButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => downloadFile(PortfolioData.resumeUrl),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.fullWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accent : AppColors.accent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppColors.accent.withValues(alpha: 0.35),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize:
                widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.download_rounded,
                size: 15,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              Text(
                'Resume',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.white,
                  fontSize: 13,
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

class _GitHubButton extends StatefulWidget {
  final bool fullWidth;
  const _GitHubButton({this.fullWidth = false});

  @override
  State<_GitHubButton> createState() => _GitHubButtonState();
}

class _GitHubButtonState extends State<_GitHubButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchLink(PortfolioData.githubUrl),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.fullWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accent : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered
                  ? AppColors.accent
                  : AppColors.accent.withValues(alpha: 0.5),
            ),
          ),
          child: Row(
            mainAxisSize:
                widget.fullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                FontAwesomeIcons.github,
                size: 14,
                color: _hovered ? Colors.white : AppColors.accent,
              ),
              const SizedBox(width: 8),
              Text(
                'GitHub',
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: _hovered ? Colors.white : AppColors.accent,
                  fontSize: 13,
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
