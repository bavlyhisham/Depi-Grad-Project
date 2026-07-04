import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final String buttontitle;
  final Color? backgroundcolor;
  final Color? foregoundcolor;
  final void Function()? onPressed;
  final double? fontSize; // خليناه يقبل يكون فاضي عشان الـ ?? تشتغل صح

  const DefaultButton({
    this.buttontitle = "",
    this.backgroundcolor = Colors.blue, // القيم الافتراضية الصح بتكون هنا
    this.foregoundcolor = Colors.white, // خلتلك لون النص أبيض عشان يبان ع الأزرق
    required this.onPressed,
    this.fontSize, // شيلنا الـ required وخليناه اختياري عشان لو متبعتش ياخد 20 تلقائي
    super.key,
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
            borderRadius: BorderRadius.circular(15.r), // تعديل بسيط هنا عشان يشتغل صح
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttontitle,
          style: TextStyle(
            fontSize: fontSize ?? 20.sp, // لو مبعتيش مقاس، هيبقى 20 تلقائي
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}