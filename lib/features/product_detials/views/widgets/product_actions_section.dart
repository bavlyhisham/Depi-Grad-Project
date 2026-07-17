import 'package:depi/features/cart/controller/cart_cubit.dart';
import 'package:depi/features/cart/controller/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsActions extends StatelessWidget {
  const ProductDetailsActions({
    super.key,
    required this.onAddToCart,
    required this.onIncrease,
    required this.onDecrease,
    required this.count,
    required this.productId,
  });

  final VoidCallback onAddToCart;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final int count;
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 12,
      shadowColor: Colors.black12,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
          child: Row(
            children: [
              Container(
                height: 52.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromRGBO(0, 65, 130, 1),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: onDecrease,
                      child: Icon(
                        Icons.remove,
                        color: const Color.fromRGBO(0, 65, 130, 1),
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      "$count",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(0, 65, 130, 1),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: onIncrease,
                      child: Icon(
                        Icons.add,
                        color: const Color.fromRGBO(0, 65, 130, 1),
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: BlocBuilder<CartCubit, CartStates>(
                  builder: (context, state) {
                    final isLoading =
                        context.watch<CartCubit>().loadingProducts[productId] ??
                        false;

                    return SizedBox(
                      height: 52.h,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : onAddToCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(0, 65, 130, 1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: isLoading
                            ? SizedBox(
                                width: 22.w,
                                height: 22.h,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2.5,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}