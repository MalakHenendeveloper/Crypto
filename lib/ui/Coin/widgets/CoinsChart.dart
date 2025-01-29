import 'package:crypto_wallets/data/model/ChartModel.dart';
import 'package:crypto_wallets/ui/Coin/Cubit/CoinsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CoinChart extends StatelessWidget {
  final CoinsViewmodel viewmodel;
  final List<ChartModel> data;

  const CoinChart({Key? key, required this.viewmodel, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      width: double.infinity,
      child: SfCartesianChart(
        trackballBehavior: viewmodel.track,
        zoomPanBehavior: ZoomPanBehavior(enablePanning: true, zoomMode: ZoomMode.x),
        series: <CandleSeries>[
          CandleSeries<ChartModel, int>(
            enableSolidCandles: true,
            enableTooltip: true,
            dataSource: data,
            bearColor: Colors.red,
            bullColor: Colors.green,
            xValueMapper: (ChartModel seals, _) => seals.time,
            lowValueMapper: (ChartModel seals, _) => seals.low,
            highValueMapper: (ChartModel seals, _) => seals.high,
            openValueMapper: (ChartModel seals, _) => seals.open,
            closeValueMapper: (ChartModel seals, _) => seals.close,
            animationDuration: 60,
          ),
        ],
      ),
    );
  }
}
