// ignore_for_file: deprecated_member_use, unused_element, avoid_print

import 'package:depi/features/cart/controller/cart_cubit.dart';
import 'package:depi/features/cart/controller/cart_states.dart';
import 'package:depi/features/cart/views/widgets/cart_item_card.dart';
import 'package:depi/features/cart/views/widgets/cart_items_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    print("Cart Screen Opened");

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CartCubit>().getCart();
    });
  }

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
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartLoadedState) {
            final products = state.cartData['data']['products'];

            final totalPrice = state.cartData['data']['totalCartPrice'];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 23.h),

              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CartItemsList(products: products),

                          SizedBox(height: 40.h),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      hintText: "Promo Code",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                SizedBox(
                                  width: 88.w,
                                  height: 33.h,

                                  child: ElevatedButton(
                                    onPressed: () {},

                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff004CFF),
                                      elevation: 0,
                                      padding: EdgeInsets.zero,

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          14.r,
                                        ),
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
                                _summaryRow('Subtotal', 'EGP $totalPrice'),

                                SizedBox(height: 10.h),

                                _summaryRow('Shipping', 'EGP 50'),

                                Divider(height: 24.h),

                                _summaryRow(
                                  'Total',
                                  'EGP ${totalPrice + 50}',
                                  isTotal: true,
                                ),

                                SizedBox(height: 18.h),

                                SizedBox(
                                  width: double.infinity,
                                  height: 52.h,

                                  child: ElevatedButton(
                                    onPressed: () {},

                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff004CFF),

                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          14.r,
                                        ),
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
                  ),
                ],
              ),
            );
          }

          if (state is CartErrorState) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        },
      ),
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
