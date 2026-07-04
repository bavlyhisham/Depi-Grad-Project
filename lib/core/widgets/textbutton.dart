import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextbutton extends StatelessWidget {
  final Color? buttonColor;
  final double? fontsize;
  final String buttonTitle;
  final FontWeight? fontWeight;
  final void Function()? onPressed;

  const DefaultTextbutton({
    this.buttonColor = Colors.black,
    this.fontsize,
    this.buttonTitle = '',
    this.fontWeight = FontWeight.bold,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0.r),
        foregroundColor: buttonColor,
        backgroundColor: const Color(0xff004182),
      ),
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(
          fontSize: fontsize ?? 20.sp, // لو مبعتيش مقاس، هيخليه 20 تلقائي
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}




