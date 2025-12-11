import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeButtonsSkeleton extends StatefulWidget {
  const TimeButtonsSkeleton({Key? key}) : super(key: key);

  @override
  State<TimeButtonsSkeleton> createState() => _TimeButtonsSkeletonState();
}

class _TimeButtonsSkeletonState extends State<TimeButtonsSkeleton>
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        5,
        (index) => AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              height: 40.h,
              width: 60.w,
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
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        ),
      ),
    );
  }
}
