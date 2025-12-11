import 'package:crypto_wallets/domain/Entity/HomeResponseEntity.dart';
import 'package:crypto_wallets/ui/Coin/Cubit/CoinsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeFilterButtons extends StatelessWidget {
  final CoinsViewmodel viewmodel;
  final HomeResponseEntity view;

  const TimeFilterButtons({Key? key, required this.viewmodel, required this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: viewmodel.text.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              int days = viewmodel.daysMap[viewmodel.text[index]] ?? 5;
              viewmodel.gecharts(view.id ?? '', days);
            },
            child: Container(
              width: 50.w,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.amber.withOpacity(0.3)),
              ),
              child: Text(
                viewmodel.text[index],
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.amber),
              ),
            ),
          );
        },
      ),
    );
  }
}
