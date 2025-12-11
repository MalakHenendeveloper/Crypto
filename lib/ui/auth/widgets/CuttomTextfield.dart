import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cuttomtextfield extends StatelessWidget {
  Cuttomtextfield(
      {super.key, required this.hint, this.controller, this.validator});
  final String hint;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      child: TextFormField(
        validator: validator,
        style: TextStyle(color: Colors.white),
        controller: controller,
        cursorColor: Colors.amber,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white.withOpacity(0.08), // Glass effect
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400]),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide:
                BorderSide(color: Colors.white.withOpacity(0.3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.amber, width: 1.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.redAccent, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(color: Colors.redAccent, width: 1.5),
          ),
        ),
      ),
    );
  }
}
