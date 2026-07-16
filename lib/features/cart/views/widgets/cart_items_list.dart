import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_item_card.dart';

class CartItemsList extends StatelessWidget {
  final List products;
  final Function(int) onDelete;
  final Function(int) onQuantityChanged;

  const CartItemsList({
    super.key,
    required this.products,
    required this.onDelete,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (_, index) => SizedBox(height: 12.h),
      itemBuilder: (_, index) {
        return CartItemCard(
          product: products[index],
          onDelete: () {
            onDelete(index);
          },
          onQuantityChanged: onQuantityChanged,
        );
      },
    );
  }
}