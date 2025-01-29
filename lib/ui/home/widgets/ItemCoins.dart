import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Itemcoins extends StatelessWidget {
  Itemcoins({super.key, required this.item});
  HomeResponseEntity item;

  String truncateTitle(String title) {
    List<String> words = title.split(' ');

    // قص النص إذا كان يحتوي على أكثر من كلمتين
    String truncated =
        words.length <= 2 ? title : "${words.sublist(0, 2).join(' ')}..";

    // التحقق إذا كان النص يحتوي على علامة "-" وقص النص عندها
    if (truncated.contains('-')) {
      truncated = truncated.split('-')[0];
    }

    return truncated;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        spacing: 10.w,
        children: [
          Image.network(
            item.image ?? 'error',
            height: 50.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                truncateTitle(item.id.toString()),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                " 0.4 ${item.symbol}",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
          Expanded(
            child: Sparkline(

              data: item.sparklineIn7d?.price
                      ?.map((e) => e.toDouble())
                      .toList() ??
                  [],
              lineWidth: 2,

              lineColor: item.marketCapChangePercentage24h! >= 0
                  ? Colors.green
                  : Colors.red,
              fillMode: FillMode.below,
              fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: item.marketCapChangePercentage24h! >= 0
                      ? [Colors.green, Colors.green.shade100]
                      : [Colors.red, Colors.red.shade100]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.priceChange24h!.toStringAsFixed(5),
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                item.marketCapChangePercentage24h!.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
