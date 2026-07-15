// ignore_for_file: deprecated_member_use

import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/product_detials/controller/product_details_cubit.dart';
import 'package:depi/features/product_detials/views/widgets/timer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsInfo extends StatelessWidget {
  final Product product;
  final ProductDetailsCubit cubit;

  const ProductDetailsInfo({
    super.key,
    required this.product,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title.split(' ').length > 4
              ? '${product.title.split(' ').take(4).join(' ')}...'
              : product.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            color: const Color(0xff06004F),
            height: 1.4,
          ),
        ),

        SizedBox(height: 14.h),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cubit.formatPrice(cubit.currentPrice),
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff06004F),
                    ),
                  ),
                  SizedBox(height: 8.h),

                  if (cubit.hasDiscount)
                    Row(
                      children: [
                        Text(
                          cubit.formatPrice(product.price),
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: const Color(0xff004182).withOpacity(0.6),
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            '-${cubit.discountPercentage}%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                cubit.hasDiscount
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffFF2D55).withOpacity(0.10),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Text(
                              'Flash Sale',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xffFF2D55),
                              ),
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.access_time_outlined,
                                color: const Color(0xff004CFF),
                                size: 22.sp,
                              ),
                              SizedBox(width: 8.w),
                              TimerBox(value: cubit.formattedHours),
                              SizedBox(width: 4.w),
                              TimerBox(value: cubit.formattedMinutes),
                              SizedBox(width: 4.w),
                              TimerBox(value: cubit.formattedSeconds),
                            ],
                          ),
                        ],
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffEBF1FF),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          product.quantity <= 20
                              ? 'Only ${product.quantity} left'
                              : '${product.quantity} in stock',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff004182),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),

        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20.sp),
            SizedBox(width: 6.w),
            Text(
              '${product.ratingsAverage} (${product.ratingsQuantity} reviews)',
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff06004F),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),

        SizedBox(height: 33.h),

        ReadMoreText(
          product.description.isNotEmpty
              ? product.description.replaceAll('\n', ' • ')
              : 'No description available',
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: ' Show More',
          trimExpandedText: ' Show Less',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade700,
            height: 1.6,
          ),
          moreStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff004182),
          ),
          lessStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff004182),
          ),
        ),
      ],
    );
  }
}
