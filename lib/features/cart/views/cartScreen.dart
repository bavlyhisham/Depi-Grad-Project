// ignore_for_file: deprecated_member_use, unused_element, avoid_print

import 'package:depi/features/cart/controller/cart_cubit.dart';
import 'package:depi/features/cart/controller/cart_states.dart';
import 'package:depi/features/cart/views/widgets/cart_items_list.dart';
import 'package:depi/features/cart/views/widgets/cart_summary.dart';
import 'package:depi/features/cart/views/widgets/promo_code_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'package:depi/features/layout/views/shop_layout.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int discount = 0;

  List products = [];
  double totalPrice = 0;

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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF004182),
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Tooltip(
          message: "Back to Home screen",
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              LayoutCubit.get(context).changebottomstate(0);

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const Shoplayout()),
                (route) => false,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Depi Store",
                  style: TextStyle(
                    color: const Color(0xff06004F),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .3,
                  ),
                ),
                // SizedBox(width: 8.w),
                // Icon(
                //   Icons.shopping_bag_outlined,
                //   color: Color(0xff004182),
                //   size: 28.sp,
                // ),
              ],
            ),
          ),
        ),
        // آيكون الشنطة والنقطة الحمراء ثابتة علطول
        actions: [
          BlocBuilder<CartCubit, CartStates>(
            builder: (context, state) {
              final cartCubit = context.read<CartCubit>();

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xFF004182),
                        size: 26,
                      ),
                      onPressed: () {
                        // الأكشن بتاعك هنا
                      },
                    ),

                    if (cartCubit.cartCount > 0)
                      Positioned(
                        top: 12,
                        right: 10,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          if (state is CartLoadingState && products.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartLoadedState) {
            products = state.cartData['data']['products'];
            totalPrice = state.cartData['data']['totalCartPrice'].toDouble();
          }

          if (products.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 23.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CartItemsList(
                    products: products,

                    onDelete: (index) {
                      final productId = products[index]['product']['_id'];

                      setState(() {
                        totalPrice -=
                            products[index]['price'] * products[index]['count'];

                        products.removeAt(index);
                      });

                      context.read<CartCubit>().removeFromCart(productId);
                    },

                    onQuantityChanged: (priceChange) {
                      setState(() {
                        totalPrice += priceChange;
                      });
                    },
                  ),

                  SizedBox(height: 40.h),

                  PromoCodeSection(
                    onApply: (value) {
                      setState(() {
                        discount = value;
                      });
                    },
                  ),

                  SizedBox(height: 19.h),
                ],
              ),
            ),
          );
        },
      ),

      bottomNavigationBar: BlocBuilder<CartCubit, CartStates>(
        builder: (context, state) {
          if (state is CartLoadedState) {
            final total = state.cartData['data']['totalCartPrice'].toDouble();

            return CartSummary(totalPrice: total, discount: discount);
          }

          return const SizedBox();
        },
      ),
    );
  }
}
