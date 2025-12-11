import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/core/Routes/Routes.dart';
import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/ui/auth/Register/Cubit/RegisterState.dart';
import 'package:crypto_wallets/ui/auth/Register/Cubit/RegisterViewmodel.dart';
import 'package:crypto_wallets/ui/auth/Register/widgets/RegisterForm.dart';
import 'package:crypto_wallets/ui/auth/Register/widgets/RegisterHeader.dart';
import 'package:crypto_wallets/ui/auth/widgets/CusttomText.dart';
import 'package:crypto_wallets/ui/widgets/glass_container.dart';
import 'package:crypto_wallets/ui/widgets/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var viewmodel = getIt<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: BlocListener<RegisterViewModel, RegisterState>(
          bloc: viewmodel,
          listener: (context, state) {
            if (state is RegisterSuccess) {
              FloatingSnackBar.show(
                  context, 'Register Success', AppColors.success);
            } else if (state is RegisterLoading) {
              // Loading handled optionally in UI overlay
            } else if (state is RegisterError) {
              FloatingSnackBar.show(
                  context, state.fauilers.errorMassage, AppColors.danger);
            }
          },
          child: Stack(
            children: [
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
                    child: RegisterHeader(),
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
                            SizedBox(height: 10.h),
                            GlassContainer(
                              padding: EdgeInsets.all(20.w),
                              child: Column(
                                children: [
                                  RegisterForm(viewmodel: viewmodel),
                                  SizedBox(height: 10.h),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRoutes.login);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Custtomtext(
                                            text: 'Already have account? ',
                                            fontsize: 16.sp,
                                            color: AppColors.textSecondary),
                                        Custtomtext(
                                            text: 'Sign In',
                                            fontsize: 16.sp,
                                            color: AppColors.info),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (viewmodel.state is RegisterLoading)
                Center(child: CircularProgressIndicator(color: AppColors.info)),
            ],
          ),
        ),
      ),
    );
  }
}
