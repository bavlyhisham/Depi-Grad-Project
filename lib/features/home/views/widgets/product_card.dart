// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Productcard extends StatelessWidget {
  const Productcard({
    required this.index,
    this.imageProvider,
    required this.products,
    super.key,
  });
  final int index;
  final ImageProvider<Object>? imageProvider;
  final List products;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          width: 2,
          color: const Color(0xff004182).withAlpha(70),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13.r),
                  topRight: Radius.circular(13.r),
                ),
                child: Image(
                  image:
                      imageProvider ??
                      NetworkImage(
                        'https://d2v5dzhdg4zhx3.cloudfront.net/web-assets/images/storypages/primary/ProductShowcasesampleimages/JPEG/Product+Showcase-1.jpg',
                      ),
                  height: 175.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              products[index].priceAfterDiscount != 0
                  ? Positioned(
                      top: 0,
                      left: -5.w,
                      child: Image.asset(
                        'assets/images/discount.png',
                        height: 60.h,
                      ),
                    )
                  : SizedBox(),
            ],
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 6.w),
            child: Column(
              spacing: 5.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.h),

                Text(
                  products[index].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    height: 1.2.h,
                    color: Color(0xff06004F),
                  ),
                ),
                products[index].priceAfterDiscount != 0
                    ? Row(
                        children: [
                          Text(
                            'EGP ${products[index].priceAfterDiscount}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(6, 0, 79, 1),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'EGP ${products[index].price}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              decoration: TextDecoration.lineThrough,
                              color: Color.fromRGBO(0, 65, 130, 0.6),
                            ),
                          ),
                        ],
                      )
                    : Text(
                        'EGP ${products[index].price}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(6, 0, 79, 1),
                        ),
                      ),
                Row(
                  spacing: 5.w,
                  children: [
                    Text(
                      'Review (${products[index].ratingsAverage})',
                      style: TextStyle(
                        color: Color.fromRGBO(6, 0, 79, 1),
                        fontSize: 15.sp,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: 20.sp,
                      color: Color.fromRGBO(253, 216, 53, 1),
                    ),
                    Spacer(),
                    // BlocBuilder<CartCubit, CartStates>(
                    //   builder: (context, state) {
                    //     var productId = products[index].id;
                    //     var cartCubit = CartCubit.get(context);
                    //     bool isLoading =
                    //         cartCubit.loadingProducts[productId] ?? false;

                    //     return SizedBox(
                    //       height: 30.h,
                    //       width: 30.w,
                    //       child: IconButton(
                    //         onPressed: () {
                    //           isLoading?null:

                    //           cartCubit.addtocart(
                    //             products[index].id,
                    //           );
                    //         },
                    //         style: IconButton.styleFrom(
                    //           padding: EdgeInsets.all(0),
                    //           backgroundColor: Color.fromRGBO(0, 65, 130, 1),
                    //         ),

                    //         icon: isLoading?SizedBox(
                    //           width: 12.w,
                    //           height: 12.h,
                    //           child: CircularProgressIndicator(color: Colors.white,)):  Icon(Icons.add,size: 25.sp,),
                    //       ),
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
