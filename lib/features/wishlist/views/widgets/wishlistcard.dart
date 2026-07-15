import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/wishlist/controller/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishListCard extends StatelessWidget {
  final Product product;
  const WishListCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    const borderWidth = 1.5;
    final outerRadius = 20.r;

    return Container(
      height: 135.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(outerRadius),
        border: Border.all(
          color: const Color(0xff004182).withOpacity(0.3),
          width: borderWidth,
        ),
      ),
      padding: const EdgeInsets.only(right: borderWidth),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(outerRadius - borderWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 120.w,
              child: Image.network(
                product.imagecover,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.broken_image, size: 50),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 14.h,
                  bottom: 14.h,
                  left: 8.w,
                  right: 14.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff06004F),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<WishlistCubit>().toggleWishlist(product);
                          },
                          child: Container(
                            padding: EdgeInsets.all(6.r),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.favorite,
                              color: Color(0xff004182),
                              size: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        SizedBox(width: 4.w),
                        Text(
                          "${product.ratingsAverage}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff06004F),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "(${product.ratingsQuantity})",
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              "EGP ${product.price}",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff06004F),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "EGP ${(product.price * 1.25).toStringAsFixed(0)}",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xff06004F).withOpacity(0.6),
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 38.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff004182),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              elevation: 0,
                            ),
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}