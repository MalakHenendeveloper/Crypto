import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/core/Resouces/AppImages.dart';
import 'package:crypto_wallets/ui/home/Cubit/HomeState.dart';
import 'package:crypto_wallets/ui/home/Cubit/HomeViewModel.dart';
import 'package:crypto_wallets/ui/home/widgets/Header.dart';
import 'package:crypto_wallets/ui/home/widgets/ItemCoins.dart';
import 'package:crypto_wallets/ui/home/widgets/Portfolio.dart';
import 'package:crypto_wallets/ui/home/widgets/RecomendCoins.dart';
import 'package:crypto_wallets/ui/home/widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  var viewmodel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 253, 225, 112),
                Color(0xffFBC700),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(),
            PortfolioBalance(),
            BodySection(
              viewmodel: viewmodel,
            ),
          ],
        ),
      ),
    ));
  }
}
