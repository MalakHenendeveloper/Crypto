import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinHeader extends StatelessWidget {
  final HomeResponseEntity view;

  const CoinHeader({Key? key, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(view.image ?? '', height: 60.h),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                view.id ?? '',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                view.symbol ?? '',
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              )
            ],
          ),
        ),
        Column(
          children: [
            Text(
              '\$ ${view.currentPrice.toString()}',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              view.marketCapChangePercentage24h.toString(),
              style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
                color: view.marketCapChangePercentage24h! >= 0
                    ? Colors.green
                    : Colors.red,
              ),
            )
          ],
        )
      ],
    );
  }
}
