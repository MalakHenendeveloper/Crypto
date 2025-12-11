import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Unified spacing system
class AppSpacing {
  // Prevent instantiation
  AppSpacing._();

  // ==================== Spacing Values ====================

  static double xs = 4.h;

  static double sm = 8.h;

  static double md = 12.h;

  static double lg = 16.h;

  static double xl = 24.h;

  static double xxl = 32.h;

  static double xxxl = 48.h;

  // ==================== Border Radius ====================
  static double radiusSm = 8.r;

  static double radiusMd = 12.r;

  static double radiusLg = 16.r;

  static double radiusXl = 20.r;

  static double radiusXxl = 24.r;

  static double radiusFull = 9999.r;

  static EdgeInsets get paddingXs => EdgeInsets.all(xs);

  static EdgeInsets get paddingSm => EdgeInsets.all(sm);

  static EdgeInsets get paddingMd => EdgeInsets.all(md);

  static EdgeInsets get paddingLg => EdgeInsets.all(lg);

  static EdgeInsets get paddingXl => EdgeInsets.all(xl);

  static EdgeInsets get paddingHorizontal =>
      EdgeInsets.symmetric(horizontal: lg);

  static EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: lg);
}
