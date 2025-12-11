
import 'package:crypto_wallets/core/Resouces/AppImages.dart';
import 'package:crypto_wallets/core/Routes/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(

        children: [
          Image.asset(AppImages.LogoSplash),
          Text(
            'The Future',
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'Learn more about crypto_walletcurrency, look to',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, color: Colors.grey),
          ),
          SizedBox(
            height: 20.h,
          ),
          Text(
            'the future in IO Crypto',
            style: TextStyle(fontSize: 20.sp, color: Colors.grey),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.home);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 80.h, horizontal: 30.w),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(color: Colors.orangeAccent, borderRadius: BorderRadius.circular(20.r)),
                child: Row(children: [Text('CREATE PORTFOLITO ',
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
                  RotationTransition(  turns: AlwaysStoppedAnimation(310 / 360),
                      child: Icon(Icons.arrow_forward_rounded)
                  )
                ],)
              ))
        ],
      ),
    ));
  }
}
