import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_item_card.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.products});

  final List products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (_, index) => SizedBox(height: 12.h),
      itemBuilder: (_, index) {
        return CartItemCard(product: products[index]);
      },
    );
  }
}
