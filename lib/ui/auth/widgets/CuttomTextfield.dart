import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class  Cuttomtextfield extends StatelessWidget {
    Cuttomtextfield({super.key, required this.hint,  this.controller});
String hint;

TextEditingController?controller;
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 15.h,
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,

            hintStyle: TextStyle(color: Colors.white),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(20.r))),
      ),
    );
  }
}
