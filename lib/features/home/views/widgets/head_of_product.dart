import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headofproduct extends StatelessWidget {
  const Headofproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      'New Products',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(6, 0, 79, 1),
                      ),
                    ),
                  );
  }
}