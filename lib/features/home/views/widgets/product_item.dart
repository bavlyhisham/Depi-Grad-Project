import 'package:cached_network_image/cached_network_image.dart';
import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/home/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class ProductItem extends StatelessWidget {
  final int index;
  final List<Product> products;

  const ProductItem({required this.index, required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => Productdetails(Productindex: index, list: products),
        //   ),
        // );
      },
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          memCacheWidth: 300,
          memCacheHeight: 300,
          imageUrl: products[index].imagecover,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[200]!,
            period: const Duration(milliseconds: 800),
            child: Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Productcard(index: index, products: products),
          imageBuilder: (context, imageProvider) =>
              Productcard(index: index, imageProvider: imageProvider, products: products),
        ),
      ),
    );
  }
}
