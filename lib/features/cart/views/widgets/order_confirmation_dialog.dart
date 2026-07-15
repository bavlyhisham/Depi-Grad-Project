import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showOrderConfirmationDialog(
  BuildContext context, {
  required double subtotal,
  required double discount,
  required double total,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),

        title: Center(
          child: Text(
            "Order Summary",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _row("Subtotal", "EGP ${subtotal.toStringAsFixed(0)}"),

            SizedBox(height: 10.h),

            _row("Discount", "- EGP ${discount.toStringAsFixed(0)}"),

            SizedBox(height: 10.h),

            _row("Shipping", "EGP 50"),

            Divider(height: 25.h),

            _row("Total", "EGP ${total.toStringAsFixed(0)}"),
          ],
        ),

        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff004182),
            ),

            onPressed: () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("✅ Order Confirmed Successfully")),
              );

              print("========== ORDER ==========");
              print("Subtotal : $subtotal");
              print("Discount : $discount");
              print("Total : $total");
              print("============================");
            },

            child: const Text(
              "Confirm Order",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}

Widget _row(String title, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [
      Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),

      Text(value),
    ],
  );
}
