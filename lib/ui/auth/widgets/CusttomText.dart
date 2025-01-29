import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custtomtext extends StatelessWidget {
   Custtomtext({super.key, required this.text,  this.color, this.fontsize, this.alignment});
String text;
Color? color;
double ?fontsize;
AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return    Container(
      alignment: alignment,
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,

      ),
      child: Text(
       text,
        style: TextStyle(
            color:color,
            fontSize:fontsize,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
