import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
            child: Text(
              'Main portfolio',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Top 10 coins',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          Text(
            'Experimental',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
