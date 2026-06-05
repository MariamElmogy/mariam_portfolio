import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SectionSubHeading extends StatelessWidget {
  final String label;
  const SectionSubHeading({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(fontFamily: 'Poppins',
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
