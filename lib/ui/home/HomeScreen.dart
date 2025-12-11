import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/core/theme/app_colors.dart';

import 'package:crypto_wallets/ui/home/Cubit/HomeViewModel.dart';
import 'package:crypto_wallets/ui/home/widgets/Header.dart';

import 'package:crypto_wallets/ui/home/widgets/Portfolio.dart';

import 'package:crypto_wallets/ui/home/widgets/body.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  var viewmodel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Header(),
            PortfolioBalance(),
            Expanded(
              child: BodySection(
                viewModel: viewmodel,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
