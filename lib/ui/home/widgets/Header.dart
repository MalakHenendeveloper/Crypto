import 'package:crypto_wallets/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Coin Wallets',
                style: AppTextStyles.heading3,
              ),
            ],
          ),
          Icon(
            Icons.notifications_outlined,
            size: 28.sp,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
