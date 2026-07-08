import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerBox extends StatelessWidget {
  final String value;

  const TimerBox({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 39.w,
      height: 36.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffEBF1FF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        value,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18.sp,
          color: const Color(0xff06004F),
        ),
      ),
    );
  }
}
