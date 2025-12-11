import 'package:crypto_wallets/core/Resouces/AppImages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(130.r),
        ),
        image: DecorationImage(
          image: AssetImage(AppImages.crypto),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}