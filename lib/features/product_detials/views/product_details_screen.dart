import 'package:depi/features/wishlist/controller/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/product_detials/controller/product_details_cubit.dart';
import 'package:depi/features/product_detials/controller/product_details_states.dart';
import 'package:depi/features/product_detials/views/widgets/product_actions_section.dart';
import 'package:depi/features/product_detials/views/widgets/product_details_image_section.dart';
import 'package:depi/features/product_detials/views/widgets/product_details_info_section.dart';
import 'package:depi/features/cart/controller/cart_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductDetailsCubit(product),
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsStates>(
        builder: (context, state) {
          final cubit = context.watch<ProductDetailsCubit>();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: const Color(0xff004182),
              centerTitle: true,
              title: Text(
                'Product Details',
                style: TextStyle(
                  color: const Color(0xff06004F),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: const Color(0xff004182),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsImage(
                    product: product,
                    isFavorite: context
                        .watch<WishlistCubit>()
                        .isProductFavorite(product),
                    onFavoriteTap: () {
                      context.read<WishlistCubit>().toggleWishlist(product);

                      cubit.toggleFavorite();
                      final isNowFavorite = context
                          .read<WishlistCubit>()
                          .isProductFavorite(product);

                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isNowFavorite
                                ? '${product.title} added to wishlist'
                                : '${product.title} removed from wishlist',
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    onShareTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Share clicked')),
                      );
                    },
                  ),

                  SizedBox(height: 20.h),

                  ProductDetailsInfo(product: product, cubit: cubit),

                  SizedBox(height: 24.h),

                  ProductDetailsActions(
                    onAddToCart: () {
                      context.read<CartCubit>().addToCart(product.id);
                    },
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
