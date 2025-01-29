import 'package:crypto_wallets/ui/home/Cubit/HomeState.dart';
import 'package:crypto_wallets/ui/home/Cubit/HomeViewModel.dart';
import 'package:crypto_wallets/ui/home/widgets/ItemCoins.dart';
import 'package:crypto_wallets/ui/home/widgets/RecomendCoins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BodySection extends StatelessWidget {
  final HomeViewModel viewmodel;

  const BodySection({super.key, required this.viewmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 720.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          topLeft: Radius.circular(50.r),
        ),
      ),
      child: BlocBuilder<HomeViewModel, HomeState>(
        bloc: viewmodel..getData(),
        builder: (context, state) {
          if (state is HomeLoading) {
            return CircularProgressIndicator();
          } else if (state is HomeSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Asset',
                      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.add),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Itemcoins(item: state.data[index]);
                    },
                  ),
                ),
                Text(
                  'Recomanded Coins',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 135.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.data.length,
                    itemBuilder: (contex, index) {
                      return Recomendcoins(item: state.data[index]);
                    },
                  ),
                ),
              ],
            );
          } else if (state is HomeError) {
            return Center(child: Text(state.fauilers.errorMassage));
          }
          return Text('Error');
        },
      ),
    );
  }
}
