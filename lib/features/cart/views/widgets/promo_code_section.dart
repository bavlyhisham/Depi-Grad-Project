import 'package:depi/features/cart/controller/promo_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PromoCodeSection extends StatefulWidget {
  final Function(int discount) onApply;

  const PromoCodeSection({super.key, required this.onApply});

  @override
  State<PromoCodeSection> createState() => _PromoCodeSectionState();
}

class _PromoCodeSectionState extends State<PromoCodeSection> {
  final promoController = TextEditingController();

  void applyPromo() {
    String enteredCode = promoController.text.trim();

    final promo = promoCodes.firstWhere(
      (element) => element.code == enteredCode,
      orElse: () => PromoCodeModel(code: "", discount: 0),
    );

    if (promo.discount > 0) {
      widget.onApply(promo.discount);
    } else {
      print("Invalid Promo Code");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: promoController,
              decoration: const InputDecoration(
                hintText: "Promo Code",
                border: InputBorder.none,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          SizedBox(
            width: 88.w,
            height: 29.h,
            child: ElevatedButton(
              onPressed: applyPromo,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 54, 182),
                elevation: 0,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r),
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
    );
  }
}
