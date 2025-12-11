import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioBalance extends StatelessWidget {
  const PortfolioBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ 7,466.20',
                style: AppTextStyles.price,
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              Text(
                '+162% all time',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
