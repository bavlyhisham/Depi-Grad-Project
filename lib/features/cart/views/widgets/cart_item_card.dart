import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/cart_cubit.dart';

class CartItemCard extends StatefulWidget {
  final VoidCallback onDelete;
  final Function(int) onQuantityChanged;
  final dynamic product;

  const CartItemCard({
    super.key,
    required this.product,
    required this.onDelete,
    required this.onQuantityChanged,
  });

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
  late int count;
  late int stock;

  @override
  void initState() {
    super.initState();

    count = widget.product['count'];
    stock = widget.product['product']['quantity'];
  }

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
              widget.product['product']['imageCover'],
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
                  widget.product['product']['title'],

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
                  widget.product['product']['brand']['name'],

                  style: TextStyle(
                    fontSize: 12.sp,
                    color: const Color(0xff9B9B9B),
                  ),
                ),

                SizedBox(height: 6.h),

                Text(
                  "EGP ${widget.product['price'] * count}",

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
              GestureDetector(
                onTap: widget.onDelete,

                child: Icon(
                  Icons.close,
                  color: const Color(0xff06004F),
                  size: 25.sp,
                ),
              ),

              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                        widget.onQuantityChanged(widget.product['price']);

                        context.read<CartCubit>().updateCartQuantity(
                          widget.product['product']['id'],
                          count,
                          stock,
                        );
                      } else {
                        widget.onDelete();
                      }
                    },

                    child: Container(
                      width: 28.w,
                      height: 28.h,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        color: Colors.white,

                        border: Border.all(
                          color: const Color(0xff004CFF),
                          width: 1.5,
                        ),
                      ),

                      child: Icon(
                        Icons.remove,
                        color: const Color(0xff004CFF),
                        size: 18.sp,
                      ),
                    ),
                  ),

                  SizedBox(width: 10.w),

                  Text(
                    "$count",

                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  SizedBox(width: 10.w),

                  GestureDetector(
                    onTap: () {
                      if (count < stock) {
                        setState(() {
                          count++;
                        });
                        widget.onQuantityChanged(widget.product['price']);

                        context.read<CartCubit>().updateCartQuantity(
                          widget.product['product']['id'],
                          count,
                          stock,
                        );
                      }
                    },

                    child: Container(
                      width: 28.w,
                      height: 28.h,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        color: const Color(0xff004CFF),
                      ),

                      child: Icon(Icons.add, color: Colors.white, size: 18.sp),
                    ),
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
