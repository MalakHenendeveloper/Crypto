import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/core/Routes/Routes.dart';
import 'package:crypto_wallets/ui/auth/widgets/CusttomText.dart';
import 'package:crypto_wallets/ui/auth/Register/Cubit/RegisterState.dart';
import 'package:crypto_wallets/ui/auth/Register/Cubit/RegisterViewmodel.dart';
import 'package:crypto_wallets/ui/auth/Register/widgets/RegisterForm.dart';
import 'package:crypto_wallets/ui/auth/Register/widgets/RegisterHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var viewmodel = getIt<RegisterViewModel>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: BlocListener<RegisterViewModel, RegisterState>(
        bloc: viewmodel,
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Success , Register'),
            ));
          } else if (state is RegisterLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Loading.....')));
          } else if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.fauilers.errorMassage),
            ));
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterHeader(),
            RegisterForm(viewmodel: viewmodel),
            InkWell(
              onTap: () {
                viewmodel..register();
              },
              child: Container(
                width: 300.w,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                alignment: Alignment.center,
                child: Custtomtext(
                  text: 'Sign Up',
                  fontsize: 20.sp,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
                child: Row(
                  children: [
                    Custtomtext(
                        text: 'Already have account?',
                        fontsize: 18.sp,
                        color: Colors.white),
                    Custtomtext(
                        text: 'Sign In', fontsize: 18.sp, color: Colors.orange)
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
