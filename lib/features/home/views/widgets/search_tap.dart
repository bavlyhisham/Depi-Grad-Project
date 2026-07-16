import 'package:depi/core/widgets/textformfiled.dart';
import 'package:depi/features/cart/controller/cart_cubit.dart';
import 'package:depi/features/cart/controller/cart_states.dart';
import 'package:depi/features/cart/views/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              enableBorderColor: const Color(0xff004182),
            ),
          ),
          SizedBox(width: 10.w),
          Material(
            color: Colors.white,
            shape: const CircleBorder(),
            child: BlocBuilder<CartCubit, CartStates>(
              builder: (context, state) {
                final cubit = context.read<CartCubit>();

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const CartScreen(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          'assets/svgs/shopingcart.svg',
                          height: 25.h,
                          width: 25.w,
                        ),
                      ),
                    ),
                    if (cubit.cartCount > 0)
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: EdgeInsets.all(5.r),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 18.w,
                            minHeight: 18.h,
                          ),
                          child: Center(
                            child: Text(
                              '${cubit.cartCount}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}