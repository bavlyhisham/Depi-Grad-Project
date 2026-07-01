import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/home/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Products extends StatelessWidget {
  const Products({required this.products, super.key});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return  SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
          childAspectRatio: .70,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return ProductItem(index: index, products: products);
          },
          childCount: products.length,
        ),
      ),
    );
  
  }
}
