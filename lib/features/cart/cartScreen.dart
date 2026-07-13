// ignore_for_file: deprecated_member_use, unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shopping Bag',
          style: TextStyle(
            color: const Color.fromARGB(255, 6, 6, 6),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 23.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 35,
                    spreadRadius: 2,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      'assets/images/bn2.jpg',
                      width: 93.w,
                      height: 93.h,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Air Jordan 1 Low SE",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: const Color(0xff06004F),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "NIKE",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff9B9B9B),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "EGP 120.00",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              color: const Color(0xff06004F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  SizedBox(
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.close,
                          color: const Color(0xff06004F),
                          size: 25.sp,
                        ),

                        const Spacer(),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  splashColor: Colors.white.withOpacity(0.25),
                                  highlightColor: Colors.white.withOpacity(
                                    0.12,
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      4.r,
                                    ), // يكبر مساحة اللمس
                                    child: Image.asset(
                                      'assets/images/minus.png',
                                      width: 28.w,
                                      height: 28.h,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10.w),
                              Text(
                                '01',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  splashColor: Colors.white.withOpacity(0.25),
                                  highlightColor: Colors.white.withOpacity(
                                    0.12,
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      4.r,
                                    ), // يكبر مساحة اللمس
                                    child: Image.asset(
                                      'assets/images/plus.png',
                                      width: 28.w,
                                      height: 28.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.w),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 35,
                    spreadRadius: 2,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      'assets/images/bn2.jpg',
                      width: 93.w,
                      height: 93.h,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Air Jordan 1 Low SE",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: const Color(0xff06004F),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "NIKE",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff9B9B9B),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "EGP 120.00",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              color: const Color(0xff06004F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  SizedBox(
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.close,
                          color: const Color(0xff06004F),
                          size: 25.sp,
                        ),

                        const Spacer(),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  splashColor: Colors.white.withOpacity(0.25),
                                  highlightColor: Colors.white.withOpacity(
                                    0.12,
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      4.r,
                                    ), // يكبر مساحة اللمس
                                    child: Image.asset(
                                      'assets/images/minus.png',
                                      width: 28.w,
                                      height: 28.h,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10.w),
                              Text(
                                '01',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  splashColor: Colors.white.withOpacity(0.25),
                                  highlightColor: Colors.white.withOpacity(
                                    0.12,
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      4.r,
                                    ), // يكبر مساحة اللمس
                                    child: Image.asset(
                                      'assets/images/plus.png',
                                      width: 28.w,
                                      height: 28.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.10),
                    blurRadius: 35,
                    spreadRadius: 2,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.asset(
                      'assets/images/bn2.jpg',
                      width: 93.w,
                      height: 93.h,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 12.w),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 3.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Air Jordan 1 Low SE",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: const Color(0xff06004F),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            "NIKE",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff9B9B9B),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "EGP 120.00",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              color: const Color(0xff06004F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  SizedBox(
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.close,
                          color: const Color(0xff06004F),
                          size: 25.sp,
                        ),

                        const Spacer(),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),

                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  splashColor: Colors.white.withOpacity(0.25),
                                  highlightColor: Colors.white.withOpacity(
                                    0.12,
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      4.r,
                                    ), // يكبر مساحة اللمس
                                    child: Image.asset(
                                      'assets/images/minus.png',
                                      width: 28.w,
                                      height: 28.h,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10.w),
                              Text(
                                '01',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  splashColor: Colors.white.withOpacity(0.25),
                                  highlightColor: Colors.white.withOpacity(
                                    0.12,
                                  ),
                                  onTap: () {},
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                      4.r,
                                    ), // يكبر مساحة اللمس
                                    child: Image.asset(
                                      'assets/images/plus.png',
                                      width: 28.w,
                                      height: 28.h,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.w),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Promo Code",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  SizedBox(
                    width: 88.w,
                    height: 33.h, // بدل الارتفاع الافتراضي
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff004CFF),
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        "Apply",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 19.h),

            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xffF8F9FB),
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Column(
                children: [
                  _summaryRow('Subtotal', 'EGP 2400'),
                  SizedBox(height: 10.h),
                  _summaryRow('Shipping', 'EGP 50'),
                  Divider(height: 24.h),
                  _summaryRow('Total', 'EGP 2450', isTotal: true),
                  SizedBox(height: 18.h),

                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff004CFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        'Checkout',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _qtyButton(IconData icon) {
    return Container(
      width: 28.w,
      height: 28.h,
      decoration: BoxDecoration(
        color: const Color(0xff004CFF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Icon(icon, color: Colors.white, size: 18.sp),
    );
  }

  static Widget _summaryRow(
    String title,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
            color: const Color(0xff06004F),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 17.sp : 14.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff06004F),
          ),
        ),
      ],
    );
  }
}
