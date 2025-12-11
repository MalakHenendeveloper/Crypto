import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'spacing.dart';

/// Reusable card decoration styles
class CardStyles {
  // Prevent instantiation
  CardStyles._();


  static BoxDecoration primary = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
    border: Border.all(
      color: AppColors.borderSubtle,
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowDark.withOpacity(0.2),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration elevated = BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
    border: Border.all(
      color: AppColors.borderMedium,
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowDark.withOpacity(0.3),
        blurRadius: 20,
        offset: const Offset(0, 8),
      ),
      BoxShadow(
        color: AppColors.shadowGlow.withOpacity(0.05),
        blurRadius: 16,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration glass = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Colors.white.withOpacity(0.15),
        Colors.white.withOpacity(0.05),
      ],
    ),
    borderRadius: BorderRadius.circular(AppSpacing.radiusXl),
    border: Border.all(
      color: Colors.white.withOpacity(0.2),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowDark.withOpacity(0.2),
        blurRadius: 16,
        offset: const Offset(0, 6),
      ),
    ],
  );

  static BoxDecoration successPill = BoxDecoration(
    color: AppColors.successBg,
    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
    border: Border.all(
      color: AppColors.success.withOpacity(0.3),
      width: 1,
    ),
  );

  static BoxDecoration dangerPill = BoxDecoration(
    color: AppColors.dangerBg,
    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
    border: Border.all(
      color: AppColors.danger.withOpacity(0.3),
      width: 1,
    ),
  );

  static BoxDecoration infoPill = BoxDecoration(
    color: AppColors.infoBg,
    borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
    border: Border.all(
      color: AppColors.info.withOpacity(0.3),
      width: 1,
    ),
  );
}
