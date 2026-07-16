// ignore_for_file: dead_code, dead_null_aware_expressions, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final String buttontitle;
  final Color? backgroundcolor;
  final Color? foregoundcolor;
  final void Function()? onPressed;
  final double? fontSize;

  const DefaultButton({
    super.key,
    this.buttontitle = "",
    this.backgroundcolor = Colors.blue,
    this.foregoundcolor = Colors.white,
    required this.onPressed,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          animationDuration: const Duration(milliseconds: 400),
          elevation: 3.r,
          backgroundColor: backgroundcolor,
          foregroundColor: foregoundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
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
