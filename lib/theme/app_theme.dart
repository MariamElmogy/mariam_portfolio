import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const background = Color(0xFFFAFAFA);
  static const surface = Color(0xFFF5F3FF);
  static const card = Color(0xFFFFFFFF);
  static const cardHover = Color(0xFFEDE9FE);
  static const accent = Color(0xFF7C3AED);
  static const accentLight = Color(0xFFA78BFA);
  static const cyan = Color(0xFF0EA5E9);
  static const orange = Color(0xFFF97316);
  static const textPrimary = Color(0xFF1E1B4B);
  static const textSecondary = Color(0xFF64748B);
  static const border = Color(0xFFDDD6FE);

  static const live = Color(0xFF10B981);
  static const production = Color(0xFF3B82F6);
  static const freelance = Color(0xFFF59E0B);
  static const openSource = Color(0xFF8B5CF6);
}

class AppTheme {
  AppTheme._();

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        surface: AppColors.surface,
        primary: AppColors.accent,
        onPrimary: Colors.white,
        onSurface: AppColors.textPrimary,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: const TextTheme().copyWith(
        displayLarge: TextStyle(fontFamily: 'Poppins',
          color: AppColors.textPrimary,
          fontSize: 64,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.5,
          height: 1.1,
        ),
        displayMedium: TextStyle(fontFamily: 'Poppins',
          color: AppColors.textPrimary,
          fontSize: 48,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.15,
        ),
        displaySmall: TextStyle(fontFamily: 'Poppins',
          color: AppColors.textPrimary,
          fontSize: 36,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        headlineLarge: TextStyle(fontFamily: 'Poppins',
          color: AppColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(fontFamily: 'Poppins',
          color: AppColors.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(fontFamily: 'Poppins',
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(fontFamily: 'Inter',
          color: AppColors.textSecondary,
          fontSize: 16,
          height: 1.75,
        ),
        bodyMedium: TextStyle(fontFamily: 'Inter',
          color: AppColors.textSecondary,
          fontSize: 14,
          height: 1.65,
        ),
        labelLarge: TextStyle(fontFamily: 'Inter',
          color: AppColors.textPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
        labelMedium: TextStyle(fontFamily: 'Inter',
          color: AppColors.textSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
        labelSmall: TextStyle(fontFamily: 'Inter',
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
