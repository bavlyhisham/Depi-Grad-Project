import 'package:cached_network_image/cached_network_image.dart';
import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/home/views/widgets/product_card.dart';
import 'package:depi/features/product_detials/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final List<Product> products;

  const ProductItem({super.key, required this.index, required this.products});

  @override
  Widget build(BuildContext context) {
    final product = products[index];

    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          imageUrl: product.imagecover,
          memCacheWidth: 400,
          memCacheHeight: 400,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[200]!,
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          errorWidget: (context, url, error) =>
              Productcard(index: index, products: products),
          imageBuilder: (context, imageProvider) => Productcard(
            index: index,
            products: products,
            imageProvider: imageProvider,
          ),
        ),
      ),
    );
  }
}
