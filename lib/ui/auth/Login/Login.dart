import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/core/Resouces/AppImages.dart';
import 'package:crypto_wallets/core/Routes/Routes.dart';
import 'package:crypto_wallets/ui/auth/Login/Cubit/LoginState.dart';
import 'package:crypto_wallets/ui/auth/Login/Cubit/LoginViewModel.dart';
import 'package:crypto_wallets/ui/auth/Login/widgets/LoginForm.dart';
import 'package:crypto_wallets/ui/auth/Login/widgets/LoginHeader.dart';
import 'package:crypto_wallets/ui/auth/widgets/CusttomText.dart';

import 'package:crypto_wallets/ui/auth/widgets/CuttomTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var viewmodel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: BlocListener<LoginViewModel, LoginState>(
        bloc: viewmodel,
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Login , Success')));
            Future.delayed(Duration(seconds: 2), () {
              Navigator.pushNamed(context, AppRoutes.home);
            });
          } else if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.fauilers.errorMassage)));
          } else if (state is LoginLoading) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginHeader(),
            LoginForm(viewmodel: viewmodel),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
                child: Row(
                  children: [
                    Custtomtext(
                        text: 'Don`t have account?',
                        fontsize: 18.sp,
                        color: Colors.white),
                    Custtomtext(
                        text: 'Sign Up', fontsize: 18.sp, color: Colors.orange)
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
