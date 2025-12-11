import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:crypto_wallets/ui/widgets/glass_container.dart';

class FloatingSnackBar {
  static void show(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: GlassContainer(
          color: color.withOpacity(0.8),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          borderRadius: 12.r,
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
        padding: EdgeInsets.zero,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
