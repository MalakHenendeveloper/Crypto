import 'package:crypto_wallets/core/Resouces/Strings.dart';
import 'package:crypto_wallets/core/theme/app_colors.dart';
import 'package:crypto_wallets/core/theme/card_styles.dart';
import 'package:crypto_wallets/core/theme/spacing.dart';
import 'package:crypto_wallets/ui/home/Cubit/HomeState.dart';
import 'package:crypto_wallets/ui/home/Cubit/HomeViewModel.dart';
import 'package:crypto_wallets/ui/home/widgets/ItemCoins.dart';
import 'package:crypto_wallets/ui/home/widgets/RecomendCoins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import 'dart:ui';

class BodySection extends StatelessWidget {
  BodySection({super.key, required this.viewModel});
  final HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(50.r),
        topLeft: Radius.circular(50.r),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
          decoration: CardStyles.glass.copyWith(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.r),
              topLeft: Radius.circular(50.r),
            ),
          ),
          child: BlocBuilder<HomeViewModel, HomeState>(
            bloc: viewModel..getData(),
            builder: (context, state) {
              if (state is HomeLoading) {
                return Shimmer.fromColors(
                  baseColor: Color(0xFF1E293B), // Dark slate
                  highlightColor:
                      Color(0xFFF59E0B).withOpacity(0.2), // Gold tint
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Row(
                        children: [
                          Container(
                              width: 50.h, height: 50.h, color: Colors.white),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: 10.h,
                                    color: Colors.white),
                                SizedBox(height: 5.h),
                                Container(
                                    width: 100.w,
                                    height: 10.h,
                                    color: Colors.white),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              } else if (state is HomeSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringsManager.assets,
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Icon(Icons.add, color: Colors.white),
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: viewModel.scrollController,
                        itemCount: state.data.length +
                            (viewModel.isMoreLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < state.data.length) {
                            return ItemCoins(item: state.data[index]);
                          } else {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.amber)),
                            );
                          }
                        },
                      ),
                    ),
                    Text(
                      StringsManager.recommendCoins,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Container(
                      height: 135.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data.length,
                        itemBuilder: (contex, index) {
                          return RecomendCoins(item: state.data[index]);
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is HomeError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.fauilers.errorMassage,
                          style: TextStyle(color: Colors.white)),
                      ElevatedButton(
                        onPressed: () {
                          viewModel..getData();
                        },
                        child: Text(StringsManager.retry),
                      )
                    ],
                  ),
                );
              }
              return Text(StringsManager.error);
            },
          ),
        ),
      ),
    );
  }
}
