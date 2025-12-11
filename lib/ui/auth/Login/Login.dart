import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/core/Routes/Routes.dart';
import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/ui/auth/Login/Cubit/LoginState.dart';
import 'package:crypto_wallets/ui/auth/Login/Cubit/LoginViewModel.dart';
import 'package:crypto_wallets/ui/auth/Login/widgets/LoginForm.dart';
import 'package:crypto_wallets/ui/auth/Login/widgets/LoginHeader.dart';
import 'package:crypto_wallets/ui/auth/widgets/CusttomText.dart';
import 'package:crypto_wallets/ui/widgets/glass_container.dart';
import 'package:crypto_wallets/ui/widgets/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var viewmodel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: BlocListener<LoginViewModel, LoginState>(
          bloc: viewmodel,
          listener: (context, state) {
            if (state is LoginSuccess) {
              FloatingSnackBar.show(
                  context, 'Login Success', AppColors.success);
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pushNamed(context, AppRoutes.home);
              });
            } else if (state is LoginError) {
              FloatingSnackBar.show(
                  context, state.fauilers.errorMassage, AppColors.danger);
            } else if (state is LoginLoading) {
              // Optional: Show loading indicator overlay or handle in UI
            }
          },
          child: Stack(
            children: [
              // Background elements or particles could go here

              Column(
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 1),
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOutBack,
                    builder: (context, double value, child) {
                      return Transform.translate(
                        offset: Offset(0, -50 * (1 - value)),
                        child: Opacity(
                          opacity: value.clamp(0.0, 1.0),
                          child: child,
                        ),
                      );
                    },
                    child: LoginHeader(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeOut,
                        builder: (context, double value, child) {
                          return Transform.translate(
                            offset: Offset(0, 100 * (1 - value)),
                            child: Opacity(
                              opacity: value,
                              child: child,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            GlassContainer(
                              padding: EdgeInsets.all(20.w),
                              child: Column(
                                children: [
                                  LoginForm(viewmodel: viewmodel),
                                  SizedBox(height: 20.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.signup);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Custtomtext(
                                            text: 'Don`t have account? ',
                                            fontsize: 16.sp,
                                            color: AppColors.textSecondary),
                                        Custtomtext(
                                            text: 'Sign Up',
                                            fontsize: 12.sp,
                                            color: AppColors.info),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 50.h), // Bottom spacing
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (viewmodel.state is LoginLoading)
                Center(child: CircularProgressIndicator(color: AppColors.info)),
            ],
          ),
        ),
      ),
    );
  }
}
