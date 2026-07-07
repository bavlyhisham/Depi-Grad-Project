// ignore_for_file: dead_code, dead_null_aware_expression, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    this.buttontitle = "",
    this.foregoundcolor,
    this.backgroundcolor,
    required this.onPressed,
    required this.fontSize,
    super.key,
  });
  String buttontitle;
  Color? backgroundcolor = Colors.blue;
  Color? foregoundcolor = Colors.blue;
  void Function()? onPressed;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          animationDuration: Duration(milliseconds: 400),

          elevation: 3.r,
          backgroundColor: backgroundcolor,
          foregroundColor: foregoundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttontitle,
          style: TextStyle(
            fontSize: fontSize ?? 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
