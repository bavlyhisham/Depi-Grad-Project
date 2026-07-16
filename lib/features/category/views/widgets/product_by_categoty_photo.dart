import 'package:depi/features/category/controler/category_cubit.dart';
import 'package:depi/features/category/views/widgets/emptycategory.dart';
import 'package:depi/features/category/views/widgets/product_by_category_photo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductByCategotyPhoto extends StatelessWidget {
  const ProductByCategotyPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryCubit categoryCubit = CategoryCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Products', style: TextStyle(fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(6, 0, 79, 1),)),
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            categoryCubit.productOFcategory.clear();
            Navigator.pop(context);
          },
        ),
      ),
      body: categoryCubit.productOFcategory.isEmpty
          ? Emptycategory()
          : CustomScrollView(
              scrollDirection: Axis.vertical,

              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.w,
                      mainAxisSpacing: 8.h,
                      childAspectRatio: .70,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return ProductByCategoryPhotoItem(index: index);
                    }, childCount: categoryCubit.productOFcategory.length),
                  ),
                ),
              ],
            ),
    );
  }
}
