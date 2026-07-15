import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi/features/cart/views/widgets/order_confirmation_dialog.dart';

class CartSummary extends StatelessWidget {
  final double totalPrice;
  final int discount;

  const CartSummary({
    super.key,
    required this.totalPrice,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    print("CartSummary totalPrice = $totalPrice");

    double discountValue = (totalPrice * discount) / 100;
    double finalTotal = totalPrice - discountValue + 50;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xffF8F9FB),
        borderRadius: BorderRadius.circular(18.r),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          _summaryRow('Subtotal', 'EGP ${totalPrice.toStringAsFixed(0)}'),

          SizedBox(height: 10.h),

          if (discount > 0)
            _summaryRow(
              'Discount',
              '- EGP ${discountValue.toStringAsFixed(0)}',
            ),

          SizedBox(height: 10.h),

          _summaryRow('Shipping', 'EGP 50'),

          Divider(height: 24.h),

          _summaryRow(
            'Total',
            'EGP ${finalTotal.toStringAsFixed(0)}',
            isTotal: true,
          ),

          SizedBox(height: 18.h),

          SizedBox(
            width: double.infinity,
            height: 52.h,
            child: ElevatedButton(
              onPressed: () {
                showOrderConfirmationDialog(
                  context,
                  subtotal: totalPrice,
                  discount: discountValue,
                  total: finalTotal,
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff004182),
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
                ),
              ),

              child: Text(
                "Checkout",
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
    );
  }

  Widget _summaryRow(String title, String value, {bool isTotal = false}) {
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
