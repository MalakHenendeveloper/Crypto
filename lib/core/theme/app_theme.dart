import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// Main app theme configuration
class AppTheme {
  // Prevent instantiation
  AppTheme._();

  /// Dark theme data
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: const ColorScheme.dark(
        primary: AppColors.info,
        secondary: AppColors.success,
        error: AppColors.danger,
        background: AppColors.bgDark,
        surface: AppColors.surface,
      ),

      // Scaffold
      scaffoldBackgroundColor: AppColors.bgDark,

      // App bar
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: AppTextStyles.heading3,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),

      // Card
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // Text theme
      textTheme: TextTheme(
        displayLarge: AppTextStyles.heading1,
        displayMedium: AppTextStyles.heading2,
        displaySmall: AppTextStyles.heading3,
        titleLarge: AppTextStyles.heading4,
        bodyLarge: AppTextStyles.bodyLarge,
        bodyMedium: AppTextStyles.bodyMedium,
        bodySmall: AppTextStyles.bodySmall,
        labelLarge: AppTextStyles.button,
        labelMedium: AppTextStyles.label,
      ),

      // Input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderSubtle),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.info, width: 2),
        ),
        labelStyle: AppTextStyles.bodyMedium,
        hintStyle: AppTextStyles.bodySmall,
      ),

      // Elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.info,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTextStyles.button,
        ),
      ),
    );
  }
}
