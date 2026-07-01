import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormField extends StatelessWidget {
  DefaultTextFormField({
    this.borderColor = Colors.blue,
    this.enableBorderColor = Colors.blue,
    this.labelText,
    this.obsecure = false,
    this.onFieldSubmittedFunction,
    this.prefixIcon,
    this.suffixIcon,
    this.validateFunction,
    super.key,
    this.controller,
    this.onSuffixPressed,
    this.hintText,
    this.borderredius,
    this.onTap,
    this.textInputAction,
  });
  String? labelText;
  String? hintText;
  Widget? prefixIcon;
  IconData? suffixIcon;
  Color borderColor;
  Color enableBorderColor;
  bool obsecure;
  double? borderredius;
  void Function()? onSuffixPressed;
  void Function()? onTap;

  String? Function(String?)? validateFunction;
  Function(String)? onFieldSubmittedFunction;
  TextEditingController? controller;
  TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap:onTap ,

      onFieldSubmitted: onFieldSubmittedFunction,
      textInputAction: textInputAction,
      obscureText: obsecure,
      validator: validateFunction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18.sp,
          color: Color(0xffB2B2B2),
          fontWeight: FontWeight.w400,
        ),
        hintTextDirection: TextDirection.ltr,
        filled: true,
        fillColor: Color(0xffFFFFFF),

        labelText: labelText,
        labelStyle: TextStyle(fontSize: 18.sp),
        prefixIcon: prefixIcon != null
            ? prefixIcon
            : null,

        suffixIcon: IconButton(
          hoverColor: Colors.white,
          style: IconButton.styleFrom(backgroundColor: Colors.transparent),
          icon: Icon(suffixIcon, color: Colors.grey),
          onPressed: onSuffixPressed,
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: borderColor)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderredius??15.r),
          borderSide: BorderSide(color: enableBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderredius??15.r),
          borderSide: BorderSide(color: enableBorderColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderredius??15.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        errorStyle: TextStyle(color: Colors.red, fontSize: 14.sp),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderredius??15.r),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
