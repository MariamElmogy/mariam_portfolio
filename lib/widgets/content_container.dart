import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class ContentContainer extends StatelessWidget {
  final Widget child;
  final double topPadding;
  final double bottomPadding;

  const ContentContainer({
    super.key,
    required this.child,
    this.topPadding = 80,
    this.bottomPadding = 80,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            isDesktop ? 60 : 24,
            topPadding,
            isDesktop ? 60 : 24,
            bottomPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
