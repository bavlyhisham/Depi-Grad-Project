// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:shop_app/features/category/controler/category_cubit.dart';
// import 'package:shop_app/features/home/controler/home_cubit.dart';
// import 'package:shop_app/features/category/views/widgets/product_by_categoty_photo.dart';

// class Categories extends StatelessWidget {
//   const Categories({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var cubit = CategoryCubit.get(context);
//     var homeCubit = HomeCubit.get(context);

//     return SizedBox(
//       width: double.infinity,
//       height: 150.h,
//       child: Padding(
//         padding: EdgeInsets.only(left: 8.w),
//         child: ListView.separated(
//           scrollDirection: Axis.horizontal,
//           physics: BouncingScrollPhysics(),
//           itemCount: cubit.categories.length,
//           separatorBuilder: (context, index) => SizedBox(width: 15.w),
//           itemBuilder: (context, index) => GestureDetector(
//             onTap: () {
//               cubit.getProductOfCategory(cubit.categories[index].name,  homeCubit.products
// );
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const ProductByCategotyPhoto()),
//               );
//             },
//             child: SizedBox(
//               width: 128.w,
//               child: CachedNetworkImage(
//                 imageUrl: cubit.categories[index].image,
//                 placeholder: (context, url) => Column(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child: Container(
//         height: 100.h,
//         width: 100.h,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           shape: BoxShape.circle,
//         ),
//       ),
//     ),
//   ]),
//                 imageBuilder: (context, imageProvider) => Column(
//                   mainAxisSize: MainAxisSize.min, // مهم جدًا
//                   children: [
//                     Container(
//                       height: 100.h,
//                       width: 100.h,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1, color: const Color(0xff004182).withAlpha(70),),
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
                          
//                           image: imageProvider,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 5.h),
//                     Text(
//                       cubit.categories[index].name,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         color: const Color.fromRGBO(6, 0, 79, 1),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }