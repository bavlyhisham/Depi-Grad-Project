import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.product});

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              product['product']['imageCover'],
              width: 93.w,
              height: 93.h,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['product']['title'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: const Color(0xff06004F),
                  ),
                ),

                SizedBox(height: 4.h),

                Text(
                  product['product']['brand']['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff9B9B9B),
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  "EGP ${product['price']}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff06004F),
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.close, color: const Color(0xff06004F), size: 25.sp),

              Row(
                children: [
                  Image.asset(
                    'assets/images/minus.png',
                    width: 28.w,
                    height: 28.h,
                  ),

                  SizedBox(width: 10.w),

                  Text(
                    "${product['count']}",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Image.asset(
                    'assets/images/plus.png',
                    width: 28.w,
                    height: 28.h,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
