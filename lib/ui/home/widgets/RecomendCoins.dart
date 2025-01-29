import 'package:crypto_wallets/core/Routes/Routes.dart';
import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recomendcoins extends StatelessWidget {
  Recomendcoins({super.key, required this.item});
  HomeResponseEntity item;

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    String truncated =
        words.length <= 2 ? title : "${words.sublist(0, 2).join(' ')}..";
    if (truncated.contains('-')) {
      truncated = truncated.split('-')[0];
    }
    return truncated;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, AppRoutes.coins, arguments: item);
      },
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.only(top: 10.h, left: 10.h),

        width: 150.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.black54)),
        child: Column(
          spacing: 5.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 35.h,
              child: Image.network(
                item.image ?? '',
              ),
            ),
            Text(
              truncateTitle(item.id ?? ''),
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '\$' + item.priceChangePercentage24h!.toStringAsFixed(3),
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  item.marketCapChangePercentage24h!.toStringAsFixed(3) + '%',
                  style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
