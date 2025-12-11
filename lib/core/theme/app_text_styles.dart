import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Prevent instantiation
  AppTextStyles._();

  // ==================== Headings ====================
  /// Extra large heading - for main titles
  static TextStyle heading1 = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  /// Large heading - for section titles
  static TextStyle heading2 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  /// Medium heading - for card titles
  static TextStyle heading3 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// Small heading
  static TextStyle heading4 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // ==================== Body Text ====================
  /// Large body text
  static TextStyle bodyLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  /// Medium body text - default
  static TextStyle bodyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Small body text
  static TextStyle bodySmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  // ==================== Special ====================
  /// Price display - with tabular figures
  static TextStyle price = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  /// Small price
  static TextStyle priceSmall = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFeatures: const [FontFeature.tabularFigures()],
  );

  /// Label text
  static TextStyle label = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textMuted,
    letterSpacing: 0.5,
  );

  /// Button text
  static TextStyle button = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );
}
