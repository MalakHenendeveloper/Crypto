import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/core/theme/app_text_styles.dart';
import 'package:crypto_wallets/core/theme/card_styles.dart';
import 'package:crypto_wallets/core/theme/spacing.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecomendCoins extends StatelessWidget {
  final HomeResponseEntity item;
  const RecomendCoins({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Check if price is going up or down
    final bool isPositive = (item.marketCapChangePercentage24h ?? 0) >= 0;
    final Color priceColor = isPositive ? AppColors.success : AppColors.danger;

    return Container(
      width: 150.w,
      margin: EdgeInsets.only(right: AppSpacing.md),
      padding: AppSpacing.paddingMd,
      decoration: CardStyles.primary,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coin Icon
          Container(
            height: 35.h,
            child: Image.network(
              item.image ?? '',
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.currency_bitcoin, size: 35.h);
              },
            ),
          ),
          SizedBox(height: AppSpacing.sm),

          // Coin Name
          Text(
            item.name?.substring(
                    0, item.name!.length > 10 ? 10 : item.name!.length) ??
                '',
            style: AppTextStyles.heading4,
          ),
          SizedBox(height: AppSpacing.xs),

          // Price and Change
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '\$${item.currentPrice?.toStringAsFixed(2) ?? '0.00'}',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.xs,
                  vertical: 2.h,
                ),
                decoration:
                    isPositive ? CardStyles.successPill : CardStyles.dangerPill,
                child: Text(
                  '${isPositive ? '+' : ''}${item.marketCapChangePercentage24h?.toStringAsFixed(1) ?? '0.0'}%',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: priceColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
