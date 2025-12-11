import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/ui/Coin/Cubit/CoinsState.dart';
import 'package:crypto_wallets/ui/Coin/Cubit/CoinsViewModel.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinHeader.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinPrice.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinsChart.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinsData.dart';
import 'package:crypto_wallets/ui/Coin/widgets/Timebutton.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinChartSkeleton.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinsDataSkeleton.dart';
import 'package:crypto_wallets/ui/Coin/widgets/TimeButtonsSkeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Coinscreen extends StatefulWidget {
  final HomeResponseEntity view;
  const Coinscreen({super.key, required this.view});

  @override
  State<Coinscreen> createState() => _CoinscreenState();
}

class _CoinscreenState extends State<Coinscreen> {
  var viewmodel = getIt<CoinsViewmodel>();

  @override
  void initState() {
    super.initState();
    viewmodel.gecharts(widget.view.id ?? 'error', 1);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppColors.backgroundGradient,
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CoinHeader(view: widget.view),
                SizedBox(height: 5.h),
                Divider(height: 1.h),
                SizedBox(height: 5.h),
                CoinPrice(view: widget.view),
                BlocBuilder<CoinsViewmodel, CoinsState>(
                  bloc: viewmodel,
                  builder: (context, state) {
                    if (state is CoinsLoading) {
                      return Column(
                        children: [
                          const CoinChartSkeleton(),
                          SizedBox(height: 15.h),
                          const CoinsDataSkeleton(),
                          SizedBox(height: 20.h),
                          const TimeButtonsSkeleton(),
                        ],
                      );
                    } else if (state is CoinsError) {
                      return Center(
                        child: Text(state.fauilers.errorMassage,
                            style: TextStyle(color: Colors.white)),
                      );
                    } else if (state is CoinsSuccess) {
                      return Column(
                        children: [
                          CoinChart(viewmodel: viewmodel, data: state.data),
                          SizedBox(height: 15.h),
                          CoinsData(view: widget.view),
                          SizedBox(height: 20.h),
                          TimeFilterButtons(
                              viewmodel: viewmodel, view: widget.view)
                        ],
                      );
                    }
                    return const Center(
                      child:
                          Text('data', style: TextStyle(color: Colors.white)),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
