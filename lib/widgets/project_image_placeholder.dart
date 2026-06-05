import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../utils/url_launcher_helper.dart';

class ProjectImagePlaceholder extends StatefulWidget {
  final ProjectStatus status;
  final Color statusColor;
  final String? imageUrl;
  final String? assetImagePath;
  final List<String> screenshotUrls;
  final bool hovered;
  final String? appStoreUrl;
  final String? playStoreUrl;

  const ProjectImagePlaceholder({
    super.key,
    required this.status,
    required this.statusColor,
    this.imageUrl,
    this.assetImagePath,
    this.screenshotUrls = const [],
    this.hovered = false,
    this.appStoreUrl,
    this.playStoreUrl,
  });

  @override
  State<ProjectImagePlaceholder> createState() =>
      _ProjectImagePlaceholderState();
}

class _ProjectImagePlaceholderState extends State<ProjectImagePlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _floatY;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat(reverse: true);
    _floatY = Tween<double>(begin: -6.0, end: 6.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  bool get _hasStoreLinks =>
      widget.appStoreUrl != null || widget.playStoreUrl != null;

  @override
  Widget build(BuildContext context) {
    final c = widget.statusColor;
    final isCode = widget.status == ProjectStatus.openSource;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: SizedBox(
        height: 220,
        width: double.infinity,
        child: Stack(
          children: [
            // Gradient base
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      c.withValues(alpha: 0.13),
                      AppColors.accent.withValues(alpha: 0.06),
                      c.withValues(alpha: 0.09),
                    ],
                  ),
                ),
              ),
            ),
            // Dot grid pattern
            Positioned.fill(
              child: CustomPaint(
                painter: _DotGridPainter(color: c.withValues(alpha: 0.09)),
              ),
            ),
            // Screenshots layout (3-phone stagger)
            if (widget.screenshotUrls.isNotEmpty)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (widget.screenshotUrls.length >= 3) ...[
                        _ScreenshotTile(
                          url: widget.screenshotUrls[0],
                          height: 175,
                          borderRadius: 10,
                          shadow: Colors.black.withValues(alpha: 0.3),
                        ),
                        const SizedBox(width: 8),
                      ],
                      _ScreenshotTile(
                        url: widget.screenshotUrls.length >= 2
                            ? widget.screenshotUrls[1]
                            : widget.screenshotUrls[0],
                        height: 200,
                        borderRadius: 12,
                        shadow: Colors.black.withValues(alpha: 0.5),
                      ),
                      if (widget.screenshotUrls.length >= 3) ...[
                        const SizedBox(width: 8),
                        _ScreenshotTile(
                          url: widget.screenshotUrls[2],
                          height: 175,
                          borderRadius: 10,
                          shadow: Colors.black.withValues(alpha: 0.3),
                        ),
                      ],
                    ],
                  ),
                ),
              )
            // Local asset design preview (full-width)
            else if (widget.assetImagePath != null)
              Positioned.fill(
                child: Image.asset(
                  widget.assetImagePath!,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  errorBuilder: (_, e, s) => const SizedBox.shrink(),
                ),
              )
            // Fallback: blurred icon background + floating icon
            else if (widget.imageUrl != null) ...[
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
                  child: Image.network(
                    widget.imageUrl!,
                    fit: BoxFit.cover,
                    loadingBuilder: (_, child, progress) =>
                        progress == null ? child : const SizedBox.shrink(),
                    errorBuilder: (_, e, s) => const SizedBox.shrink(),
                  ),
                ),
              ),
              Positioned.fill(
                child: Container(color: Colors.black.withValues(alpha: 0.45)),
              ),
              Center(
                child: AnimatedBuilder(
                  animation: _floatY,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(0, _floatY.value),
                    child: child,
                  ),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.45),
                          blurRadius: 32,
                          offset: const Offset(0, 12),
                        ),
                        BoxShadow(
                          color: c.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        widget.imageUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, progress) =>
                            progress == null ? child : const SizedBox.shrink(),
                        errorBuilder: (_, e, s) => const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ),
              ),
            ]
            else
              Center(
                child: AnimatedBuilder(
                  animation: _floatY,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(0, _floatY.value),
                    child: child,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: c.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: c.withValues(alpha: 0.22),
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: c.withValues(alpha: 0.14),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Icon(
                          isCode
                              ? Icons.code_rounded
                              : Icons.phone_android_rounded,
                          size: 30,
                          color: c.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Screenshot coming soon',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color:
                              AppColors.textSecondary.withValues(alpha: 0.45),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            // Store link overlay on hover
            if (_hasStoreLinks)
              Positioned.fill(
                child: AnimatedOpacity(
                  opacity: widget.hovered ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 220),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.52),
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.appStoreUrl != null)
                            _StoreOverlayButton(
                              url: widget.appStoreUrl!,
                              icon: FontAwesomeIcons.apple,
                              iconSize: 22,
                            ),
                          if (widget.appStoreUrl != null &&
                              widget.playStoreUrl != null)
                            const SizedBox(width: 20),
                          if (widget.playStoreUrl != null)
                            _StoreOverlayButton(
                              url: widget.playStoreUrl!,
                              icon: FontAwesomeIcons.googlePlay,
                              iconSize: 18,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StoreOverlayButton extends StatefulWidget {
  final String url;
  final IconData icon;
  final double iconSize;

  const _StoreOverlayButton({
    required this.url,
    required this.icon,
    required this.iconSize,
  });

  @override
  State<_StoreOverlayButton> createState() => _StoreOverlayButtonState();
}

class _StoreOverlayButtonState extends State<_StoreOverlayButton> {
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
          duration: const Duration(milliseconds: 150),
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _hovered
                ? Colors.white.withValues(alpha: 0.25)
                : Colors.white.withValues(alpha: 0.12),
            border: Border.all(
              color: Colors.white.withValues(alpha: _hovered ? 0.8 : 0.45),
              width: 1.5,
            ),
          ),
          child: Center(
            child: FaIcon(widget.icon,
                color: Colors.white, size: widget.iconSize),
          ),
        ),
      ),
    );
  }
}

class _ScreenshotTile extends StatelessWidget {
  final String url;
  final double height;
  final double borderRadius;
  final Color shadow;

  const _ScreenshotTile({
    required this.url,
    required this.height,
    required this.borderRadius,
    required this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    final width = height * (392 / 696);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(color: shadow, blurRadius: 16, offset: const Offset(0, 6)),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: url.startsWith('assets/')
            ? Image.asset(url, fit: BoxFit.cover,
                errorBuilder: (_, e, s) => const SizedBox.shrink())
            : Image.network(
                url,
                fit: BoxFit.cover,
                loadingBuilder: (_, child, progress) =>
                    progress == null ? child : const SizedBox.shrink(),
                errorBuilder: (_, e, s) => const SizedBox.shrink(),
              ),
      ),
    );
  }
}

class _DotGridPainter extends CustomPainter {
  final Color color;
  const _DotGridPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    const spacing = 18.0;
    const r = 1.3;
    for (double x = spacing / 2; x < size.width; x += spacing) {
      for (double y = spacing / 2; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), r, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter old) => old.color != color;
}
