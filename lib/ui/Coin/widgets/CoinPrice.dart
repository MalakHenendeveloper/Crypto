import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoinPriceDetails extends StatelessWidget {
  final HomeResponseEntity view;

  const CoinPriceDetails({Key? key, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Column(
          children: [
            Text(
              'Low Price',
              style: TextStyle(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              view.low24h.toString(),
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
        SizedBox(
          width: 20.w,
        ),
        Column(
          children: [
            Text(
              'High Price',
              style: TextStyle(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              view.high24h.toString(),
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            )
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text(
              'Volume',
              style: TextStyle(
                  fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              view.totalVolume.toString() + '%',
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: view.totalVolume! >= 0
                      ? Colors.green
                      : Colors.red),
            )
          ],
        )
      ],
    );
  }}
