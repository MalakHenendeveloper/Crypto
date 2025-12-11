import 'package:crypto_wallets/ui/auth/widgets/CusttomText.dart';

import 'package:crypto_wallets/ui/auth/widgets/CuttomTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Cubit/RegisterViewmodel.dart';

class RegisterForm extends StatelessWidget {
  final RegisterViewModel viewmodel;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterForm({required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custtomtext(text: 'Sign Up', fontsize: 18.sp, color: Colors.white),
            SizedBox(height: 15.h),
            Custtomtext(text: 'Name', fontsize: 18.sp, color: Colors.white),
            Cuttomtextfield(
              hint: 'Name',
              controller: viewmodel.name,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            Custtomtext(text: 'Email', fontsize: 18.sp, color: Colors.white),
            Cuttomtextfield(
              hint: 'Email',
              controller: viewmodel.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            Custtomtext(text: 'Password', fontsize: 18.sp, color: Colors.white),
            Cuttomtextfield(
              hint: 'Password',
              controller: viewmodel.password,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            InkWell(
              borderRadius: BorderRadius.circular(20.r),
              onTap: () {
                if (formKey.currentState!.validate()) {
                  viewmodel.register();
                }
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFD700), // Gold
                      Color(0xFFFFA500), // Orange
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Custtomtext(
                  text: 'Sign Up',
                  fontsize: 20.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
