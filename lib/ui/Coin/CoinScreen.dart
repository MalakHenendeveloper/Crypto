import 'package:crypto_wallets/core/Injactable/injactable.dart';
import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/ui/Coin/Cubit/CoinsState.dart';
import 'package:crypto_wallets/ui/Coin/Cubit/CoinsViewModel.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinHeader.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinPrice.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinsChart.dart';
import 'package:crypto_wallets/ui/Coin/widgets/CoinsData.dart';
import 'package:crypto_wallets/ui/Coin/widgets/Timebutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Coinscreen extends StatelessWidget {
  Coinscreen({super.key, required this.view});
  HomeResponseEntity view;
  var viewmodel = getIt<CoinsViewmodel>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          children: [
            CoinHeader(view:view),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              height: 1.h,
            ),
            SizedBox(
              height: 5.h,
            ),
            CoinPriceDetails(view: view,),
            BlocBuilder<CoinsViewmodel, CoinsState>(
                bloc: viewmodel..gecharts(view.id??'error',1),
                builder: (context, state) {
                  if (state is CoinsLoading) {
                    return CircularProgressIndicator();
                  } else if (state is CoinsError) {
                    return Center(
                      child: Text(state.fauilers.errorMassage),
                    );
                  } else if (state is CoinsSuccess) {
                    return Column(
                      children: [
                        CoinChart(viewmodel: viewmodel,data: state.data,),
                        SizedBox(
                          height: 15.h,
                        ),
                        CoinsData(view: view,),
                        SizedBox(
                          height: 20.h,
                        ),
                        TimeFilterButtons(viewmodel: viewmodel,view: view,)
                      ],
                    );
                  }
                  return Center(
                    child: Text('data'),
                  );
                })
          ],
        ),
      )),
    );
  }
}
