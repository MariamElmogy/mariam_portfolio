import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../utils/url_launcher_helper.dart';

// Generic outline button — GitHub / website
class CardLinkButton extends StatefulWidget {
  final String url;
  final String label;

  const CardLinkButton({super.key, required this.url, required this.label});

  @override
  State<CardLinkButton> createState() => _CardLinkButtonState();
}

class _CardLinkButtonState extends State<CardLinkButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchLink(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.inter(
                  color: _hovered ? Colors.white : AppColors.accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              Icon(Icons.arrow_outward_rounded,
                  size: 14,
                  color: _hovered ? Colors.white : AppColors.accent),
            ],
          ),
        ),
      ),
    );
  }
}

// Apple App Store badge
class AppStoreBadge extends StatefulWidget {
  final String url;
  const AppStoreBadge({super.key, required this.url});

  @override
  State<AppStoreBadge> createState() => _AppStoreBadgeState();
}

class _AppStoreBadgeState extends State<AppStoreBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchLink(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFF2C2C2E)
                : const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: FaIcon(FontAwesomeIcons.apple,
              color: Colors.white, size: 20),
        ),
      ),
    );
  }
}

// Google Play Store badge
class PlayStoreBadge extends StatefulWidget {
  final String url;
  const PlayStoreBadge({super.key, required this.url});

  @override
  State<PlayStoreBadge> createState() => _PlayStoreBadgeState();
}

class _PlayStoreBadgeState extends State<PlayStoreBadge> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchLink(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: _hovered
                ? const Color(0xFF1A3A2A)
                : const Color(0xFF0F2318),
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: FaIcon(FontAwesomeIcons.googlePlay,
              color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
