import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/core/theme/spacing.dart';
import 'package:flutter/material.dart';

class CoinsDataSkeleton extends StatefulWidget {
  const CoinsDataSkeleton({Key? key}) : super(key: key);

  @override
  State<CoinsDataSkeleton> createState() => _CoinsDataSkeletonState();
}

class _CoinsDataSkeletonState extends State<CoinsDataSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              Expanded(child: _buildSkeletonCard()),
              SizedBox(width: AppSpacing.md),
              Expanded(child: _buildSkeletonCard()),
            ],
          ),
          SizedBox(height: AppSpacing.md),

          // Second Row
          Row(
            children: [
              Expanded(child: _buildSkeletonCard()),
              SizedBox(width: AppSpacing.md),
              Expanded(child: _buildSkeletonCard()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkeletonCard() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          padding: AppSpacing.paddingLg,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                _animation.value - 0.3,
                _animation.value,
                _animation.value + 0.3,
              ],
              colors: [
                AppColors.surface,
                AppColors.surface.withOpacity(0.5),
                AppColors.surface,
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title skeleton
              Container(
                height: 16,
                width: 80,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              SizedBox(height: AppSpacing.sm),

              // Value skeleton
              Container(
                height: 24,
                width: 120,
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
