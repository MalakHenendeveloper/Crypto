import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/core/theme/app_text_styles.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinPrice extends StatelessWidget {
  final HomeResponseEntity view;
  const CoinPrice({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Low Price
        Column(
          children: [
            Text(
              'Low Price',
              style: AppTextStyles.label,
            ),
            Text(
              view.low24h?.toString() ?? '0',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.danger,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),

        // Current Price
        Column(
          children: [
            Text(
              'Current Price',
              style: AppTextStyles.label,
            ),
            Text(
              view.currentPrice?.toString() ?? '0',
              style: AppTextStyles.price.copyWith(
                fontSize: 20.sp,
              ),
            )
          ],
        ),

        // High Price
        Column(
          children: [
            Text(
              'High Price',
              style: AppTextStyles.label,
            ),
            Text(
              view.high24h?.toString() ?? '0',
              style: AppTextStyles.bodyLarge.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
