import 'package:depi/features/home/controler/home_cubit.dart';
import 'package:depi/features/home/controler/home_states.dart';
import 'package:depi/features/home/views/widgets/banner.dart';
import 'package:depi/features/home/views/widgets/categories.dart';
import 'package:depi/features/home/views/widgets/head_of_category.dart';
import 'package:depi/features/home/views/widgets/head_of_product.dart';
import 'package:depi/features/home/views/widgets/products.dart';
import 'package:depi/features/home/views/widgets/search_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final TextEditingController _searchController = TextEditingController();

  Widget _buildHomeContent(HomeCubit cubit) {
    if (!cubit.isSearchActive) {
      return CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(child: ShopBanner()),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Headofcategory(),
                Categories(),
                Headofproduct(),
              ]),
            ),
          ),
          Products(products: cubit.products),
        ],
      );
    }

    if (cubit.submittedQuery.isEmpty) {
      return Container(color: Colors.white);
    }

    final matchedProducts = cubit.searchedProducts;

    if (matchedProducts.isEmpty) {
      return Container(color: Colors.white);
    }

    return CustomScrollView(
      slivers: [
        Products(products: matchedProducts),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var categoryCubit = CategoryCubit.get(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        // return BlocListener<CartCubit, CartStates>(
        //   listener: (context, state) {
        //     state is AddToCartSuccessfulState
        //         ? ScaffoldMessenger.of(context).showSnackBar(
        //             SnackBar(
        //               behavior: SnackBarBehavior.floating,
        //               margin: EdgeInsets.all(16.w),
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(12.r),
        //               ),
        //               backgroundColor: Colors.green,
        //               duration: Duration(seconds: 2),
        //               content: Row(
        //                 children: [
        //                   Icon(
        //                     Icons.check_circle,
        //                     color: Colors.white,
        //                     size: 22.sp,
        //                   ),
        //                   SizedBox(width: 10.w),
        //                   Expanded(
        //                     child: Text(
        //                       'Product added to cart successfully!',
        //                       style: TextStyle(
        //                         fontSize: 16.sp,
        //                         fontWeight: FontWeight.w500,
        //                         color: Colors.white,
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           )
        //         : state is AddToCartErrorState
        //         ? ScaffoldMessenger.of(context).showSnackBar(
        //             SnackBar(
        //               behavior: SnackBarBehavior.floating,
        //               margin: EdgeInsets.all(16.w),
        //               shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.circular(12.r),
        //               ),
        //               backgroundColor: Colors.red,
        //               duration: Duration(seconds: 2),
        //               content: Row(
        //                 children: [
        //                   Icon(Icons.error, color: Colors.white, size: 22.sp),
        //                   SizedBox(width: 10.w),
        //                   Expanded(
        //                     child: Text(
        //                       'Failed to add product to cart',
        //                       style: TextStyle(
        //                         fontSize: 16.sp,
        //                         fontWeight: FontWeight.w500,
        //                         color: Colors.white,
        //                       ),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           )
        //         : null;
        //   },

          return PopScope(
            canPop: !cubit.isSearchActive,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop && cubit.isSearchActive) {
                cubit.resetSearch();
                _searchController.clear();
              }
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              body:
                  cubit.products.isNotEmpty
                      ?
                 Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                      child: Searchtap(
                        controller: _searchController,
                        onSearchTap: cubit.activateSearch,
                        onSearchSubmitted: cubit.submitSearch,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Expanded(child: _buildHomeContent(cubit)),
                  ],
                )
                :  const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(0, 65, 130, 1),
                  ),
                ),
                ),
              
          
          
        );
      },
    );
  }
}
