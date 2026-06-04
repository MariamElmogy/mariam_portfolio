import 'package:flutter/widgets.dart';

class Responsive {
  Responsive._();

  static const double mobileBreakpoint = 768;
  static const double desktopBreakpoint = 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopBreakpoint;

  static int projectCrossAxisCount(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w < mobileBreakpoint) return 1;
    return 2;
  }
}
