import 'package:flutter/material.dart';

class ScrollRevealScope extends InheritedNotifier<ValueNotifier<double>> {
  const ScrollRevealScope({
    super.key,
    required ValueNotifier<double> notifier,
    required super.child,
  }) : super(notifier: notifier);

  static ValueNotifier<double>? of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<ScrollRevealScope>()
          ?.notifier;
}

class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final double slideDistance;

  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.slideDistance = 48,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;
  bool _triggered = false;
  ValueNotifier<double>? _notifier;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );
    _opacity = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: Offset(0, widget.slideDistance / 500),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _notifier?.removeListener(_check);
    _notifier = ScrollRevealScope.of(context);
    _notifier?.addListener(_check);
  }

  void _check() {
    if (_triggered || !mounted) return;
    final box = context.findRenderObject() as RenderBox?;
    if (box == null || !box.attached) return;
    try {
      final pos = box.localToGlobal(Offset.zero);
      final screenH = MediaQuery.sizeOf(context).height;
      if (pos.dy < screenH + 60) {
        _triggered = true;
        Future.delayed(widget.delay, () {
          if (mounted) _ctrl.forward();
        });
      }
    } catch (_) {}
  }

  @override
  void dispose() {
    _notifier?.removeListener(_check);
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
        opacity: _opacity,
        child: SlideTransition(position: _slide, child: widget.child),
      );
}
