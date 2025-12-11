import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/core/theme/app_text_styles.dart';
import 'package:crypto_wallets/core/theme/card_styles.dart';
import 'package:crypto_wallets/core/theme/spacing.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/ui/Coin/CoinScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

class ItemCoins extends StatelessWidget {
  final HomeResponseEntity item;
  const ItemCoins({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Check if price is going up or down
    final bool isPositive = (item.marketCapChangePercentage24h ?? 0) >= 0;
    final Color priceColor = isPositive ? AppColors.success : AppColors.danger;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Coinscreen(view: item),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: AppSpacing.sm),
        padding: AppSpacing.paddingMd,
        decoration: CardStyles.elevated,
        child: Row(
          children: [
            // Coin Icon
            Container(
              padding: EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.info.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Image.network(
                item.image ?? '',
                height: 40.h,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.currency_bitcoin, size: 40.h);
                },
              ),
            ),
            SizedBox(width: AppSpacing.md),

            // Coin Name and Symbol
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name ?? '',
                    style: AppTextStyles.heading4,
                  ),
                  Text(
                    item.symbol?.toUpperCase() ?? '',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),

            // Sparkline Chart
            SizedBox(
              width: 80.w,
              height: 40.h,
              child: Sparkline(
                data: item.sparklineIn7d?.price
                        ?.map((e) => e.toDouble())
                        .toList() ??
                    [],
                lineWidth: 2,
                lineColor: priceColor,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    priceColor.withOpacity(0.3),
                    priceColor.withOpacity(0.0),
                  ],
                ),
              ),
            ),
            SizedBox(width: AppSpacing.md),

            // Price and Change
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${item.currentPrice?.toStringAsFixed(2) ?? '0.00'}',
                  style: AppTextStyles.priceSmall,
                ),
                SizedBox(height: AppSpacing.xs),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                    vertical: AppSpacing.xs,
                  ),
                  decoration: isPositive
                      ? CardStyles.successPill
                      : CardStyles.dangerPill,
                  child: Text(
                    '${isPositive ? '+' : ''}${item.marketCapChangePercentage24h?.toStringAsFixed(2) ?? '0.00'}%',
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
      ),
    );
  }
}
