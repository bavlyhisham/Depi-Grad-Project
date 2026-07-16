import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/cart/controller/cart_cubit.dart';
import 'package:depi/features/product_detials/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final hasDiscount =
        product.priceAfterDiscount != 0 &&
        product.priceAfterDiscount < product.price;

    return InkWell(
      borderRadius: BorderRadius.circular(15.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
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
                  child: CachedNetworkImage(
                    imageUrl: product.imagecover,
                    height: 175.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => SizedBox(
                      height: 175.h,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => SizedBox(
                      height: 175.h,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                if (hasDiscount)
                  Positioned(
                    top: 0,
                    left: -5.w,
                    child: Image.asset(
                      'assets/images/discount.png',
                      height: 60.h,
                    ),
                  ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.w,
                right: 8.w,
                top: 6.h,
                bottom: 8.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      height: 1.2,
                      color: const Color(0xff06004F),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  hasDiscount
                      ? Row(
                          children: [
                            Text(
                              'EGP ${product.priceAfterDiscount}',
                              style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff06004F),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'EGP ${product.price.toInt()}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                decoration: TextDecoration.lineThrough,
                                color: const Color.fromRGBO(0, 65, 130, 0.6),
                              ),
                            ),
                          ],
                        )
                      : Text(
                          'EGP ${product.price.toInt()}',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff06004F),
                          ),
                        ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Text(
                        'Review (${product.ratingsAverage})',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: const Color(0xff06004F),
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.star,
                        size: 18.sp,
                        color: const Color(0xFFFDD835),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 30.w,
                        height: 30.h,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.read<CartCubit>().addToCart(
                              product.id,
                              1,
                              product.quantity,
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${product.title} added to cart!',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff004182),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
