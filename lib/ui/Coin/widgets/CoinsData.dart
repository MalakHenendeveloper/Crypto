import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/core/theme/app_text_styles.dart';
import 'package:crypto_wallets/core/theme/card_styles.dart';
import 'package:crypto_wallets/core/theme/spacing.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';

class CoinsData extends StatelessWidget {
  final HomeResponseEntity view;
  const CoinsData({Key? key, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.paddingLg,
      margin: EdgeInsets.symmetric(
        horizontal: AppSpacing.xs,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  "🏆 ATH",
                  "\$${view.ath?.toStringAsFixed(2) ?? '--'}",
                  AppColors.success,
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildStatCard(
                  "📉 ATH Change",
                  "${view.athChangePercentage?.toStringAsFixed(2) ?? '--'}%",
                  AppColors.danger,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.md),

          // Second Row
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  "🔄 Circulating",
                  view.circulatingSupply?.toStringAsFixed(0) ?? "--",
                  AppColors.info,
                ),
              ),
              SizedBox(width: AppSpacing.md),
              Expanded(
                child: _buildStatCard(
                  "💰 Total Supply",
                  view.totalSupply?.toStringAsFixed(0) ?? "--",
                  AppColors.success,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color valueColor) {
    return Container(
      padding: AppSpacing.paddingLg,
      decoration: CardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            title,
            style: AppTextStyles.label,
          ),
          SizedBox(height: AppSpacing.sm),

          // Value
          Text(
            value,
            style: AppTextStyles.heading4.copyWith(
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
