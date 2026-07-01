import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextbutton extends StatelessWidget {
  DefaultTextbutton({
    this.buttonColor,
    this.fontsize,
    this.buttonTitle = '',
    this.fontWeight,
    required this.onPressed,
    super.key,
  });
  FontWeight? fontWeight = FontWeight.bold;
  double? fontsize = 20.sp;
  String buttonTitle;
  Color? buttonColor = Colors.black;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0.r),
        foregroundColor: buttonColor,
        backgroundColor: Color(0xff004182)
      ),
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: TextStyle(fontSize: fontsize, fontWeight: fontWeight),
      ),
    );
  }
}
