import 'package:cached_network_image/cached_network_image.dart';
import 'package:depi/features/category/controler/category_cubit.dart';
import 'package:depi/features/category/controler/category_cubit_states.dart';
import 'package:depi/features/home/views/widgets/product_card.dart';
import 'package:depi/features/product_detials/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class ProductByCategoryPhotoItem extends StatelessWidget {
  const ProductByCategoryPhotoItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (context, state) {
        CategoryCubit categoryCubit = CategoryCubit.get(context);
        return InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ProductDetailsScreen(product: categoryCubit.productOFcategory[index]),
              ),
            );
          },
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              memCacheWidth: 300,
              memCacheHeight: 300,
              imageUrl: categoryCubit.productOFcategory[index].imagecover,
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
              errorWidget: (context, url, error) => Productcard(index: index, products: categoryCubit.productOFcategory),
              imageBuilder: (context, imageProvider) =>
                  Productcard(index: index, imageProvider: imageProvider, products: categoryCubit.productOFcategory),
            ),
          ),
        );
      },
    );
  }
}
