import 'package:crypto_wallets/ui/auth/widgets/CusttomText.dart';

import 'package:crypto_wallets/ui/auth/widgets/CuttomTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Cubit/RegisterViewmodel.dart';

class RegisterForm extends StatelessWidget {
  final RegisterViewModel viewmodel;
  RegisterForm({required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Custtomtext(text: 'Sign Up', fontsize: 18.sp, color: Colors.white),
          SizedBox(height: 15.h),
          Custtomtext(text: 'Name', fontsize: 18.sp, color: Colors.white),
          Cuttomtextfield(hint: 'Name', controller: viewmodel.name),
          Custtomtext(text: 'Email', fontsize: 18.sp, color: Colors.white),
          Cuttomtextfield(hint: 'Email', controller: viewmodel.email),
          Custtomtext(text: 'Password', fontsize: 18.sp, color: Colors.white),
          Cuttomtextfield(hint: 'Password', controller: viewmodel.password),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () => viewmodel.register(),
            child: Container(
              width: 300.w,
              padding: EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Custtomtext(text: 'Sign Up', fontsize: 20.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}