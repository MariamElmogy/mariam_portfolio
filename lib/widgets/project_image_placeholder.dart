import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';

class ProjectImagePlaceholder extends StatefulWidget {
  final ProjectStatus status;
  final Color statusColor;
  final String? imageUrl;

  const ProjectImagePlaceholder({
    super.key,
    required this.status,
    required this.statusColor,
    this.imageUrl,
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
            // App image or animated placeholder
            if (widget.imageUrl != null)
              Center(
                child: AnimatedBuilder(
                  animation: _floatY,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(0, _floatY.value),
                    child: child,
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: [
                        BoxShadow(
                          color: c.withValues(alpha: 0.25),
                          blurRadius: 24,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22),
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
              )
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
                        style: GoogleFonts.inter(
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
          ],
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
