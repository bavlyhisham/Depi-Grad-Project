// ignore_for_file: unused_import

import 'package:depi/core/widgets/textformfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Searchtap extends StatelessWidget {
  const Searchtap({
    this.controller,
    this.onSearchTap,
    this.onSearchSubmitted,
    super.key,
  });

  final TextEditingController? controller;
  final VoidCallback? onSearchTap;
  final ValueChanged<String>? onSearchSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: Row(
        children: [
          Expanded(
            child: DefaultTextFormField(
              controller: controller,
              onTap: onSearchTap,
              onFieldSubmittedFunction: onSearchSubmitted,
              textInputAction: TextInputAction.search,
              hintText: 'what do you search for?',
              prefixIcon: Padding(
                padding: EdgeInsets.all(12.r),
                child: SvgPicture.asset(
                  'assets/svgs/searchicon.svg',
                  height: 24.h,
                  width: 24.w,
                ),
              ),

              borderredius: 25.r,

              enableBorderColor: Color(0xff004182),
            ),
          ),
          SizedBox(width: 10.w),
          // Material(
          //   color: Colors.white,
          //   shape: const CircleBorder(),
          //   child: BlocBuilder<CartCubit, CartStates>(
          //   builder: (context, state) {
          //     var cartCubit = CartCubit.get(context);
          //     int cartItemCount = cartCubit.cartProducts.length?? 0;
          //     return Stack(
          //       children: [
          //         InkWell(
          //           customBorder: const CircleBorder(),
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(builder: (context) => Cartscreen()),
          //             );
          //           },
          //           child: Padding(
          //             padding: const EdgeInsets.all(12),
          //             child: SvgPicture.asset(
          //               'assets/svgs/shopingcart.svg',
          //               height: 25.h,
          //               width: 25.w,
          //             ),
          //           ),
          //         ),
          //         if (cartItemCount > 0)
          //           Positioned(
          //             right: 0,
          //             top: 0,
          //             child: Container(
          //               padding: EdgeInsets.all(4.r),
          //               decoration: BoxDecoration(

          //                 shape: BoxShape.circle,
          //               ),
          //               child: Text(
          //                 '$cartItemCount',
          //                 style: TextStyle(
          //                   color: Colors.white,
          //                   fontSize: 12.sp,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ),
          //       ],
          //     );

          //   },
          //   ),
          // ),
        ],
      ),
    );
  }
}
