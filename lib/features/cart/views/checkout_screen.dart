import 'package:depi/core/cash/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:depi/features/cart/controller/cart_cubit.dart';

class CheckoutScreen extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double shipping;

  const CheckoutScreen({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.shipping,
  });

  @override
  Widget build(BuildContext context) {
    final total = subtotal - discount + shipping;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff004182),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(22.r),
                  decoration: BoxDecoration(
                    color: const Color(0xffF8F9FB),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.receipt_long_rounded,
                        color: const Color(0xff004182),
                        size: 42.sp,
                      ),

                      SizedBox(height: 10.h),

                      Text(
                        "Order Summary",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff004182),
                        ),
                      ),

                      SizedBox(height: 28.h),

                      _row("Subtotal", subtotal),

                      SizedBox(height: 16.h),

                      _row("Discount", -discount),

                      SizedBox(height: 16.h),

                      _row("Shipping", shipping),

                      SizedBox(height: 20.h),

                      const Divider(),

                      SizedBox(height: 20.h),

                      _row("Total", total, isTotal: true),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 55.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff004182),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                ),
                onPressed: () async {
                  int orderNumber =
                      CacheHelper.getData(key: 'orderNumber') ?? 100;

                  await context.read<CartCubit>().clearCart();

                  if (!context.mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Order #$orderNumber confirmed successfully 🎉",
                      ),
                    ),
                  );

                  await CacheHelper.saveData(
                    key: 'orderNumber',
                    value: orderNumber + 1,
                  );

                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Text(
                  "Confirm Order",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, double value, {bool isTotal = false}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 18.sp : 15.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: const Color(0xff06004F),
          ),
        ),
        const Spacer(),
        Text(
          "EGP ${value.toStringAsFixed(0)}",
          style: TextStyle(
            fontSize: isTotal ? 18.sp : 15.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xff06004F),
          ),
        ),
      ],
    );
  }
}
