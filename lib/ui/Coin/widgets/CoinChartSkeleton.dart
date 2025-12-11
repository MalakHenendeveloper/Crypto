import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinChartSkeleton extends StatefulWidget {
  const CoinChartSkeleton({Key? key}) : super(key: key);

  @override
  State<CoinChartSkeleton> createState() => _CoinChartSkeletonState();
}

class _CoinChartSkeletonState extends State<CoinChartSkeleton>
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
    return SizedBox(
      height: 400.h,
      width: double.infinity,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Container(
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
            child: Stack(
              children: [
                // Simulated chart bars
                Positioned(
                  bottom: 40.h,
                  left: 20.w,
                  right: 20.w,
                  top: 40.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      20,
                      (index) => Container(
                        width: 8.w,
                        height: (50 + (index % 5) * 30).h,
                        decoration: BoxDecoration(
                          color: AppColors.textSecondary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
