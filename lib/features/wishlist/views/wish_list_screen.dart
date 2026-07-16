import 'package:depi/features/cart/views/cartScreen.dart';
import 'package:depi/features/home/views/widgets/search_tap.dart';
import 'package:depi/features/layout/controler/layout_cubit.dart'; // استيراد الـ LayoutCubit
import 'package:depi/features/wishlist/controller/wishlist_cubit.dart';
import 'package:depi/features/wishlist/views/widgets/wishlistcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(child: const Searchtap()),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartScreen()),
                      );
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/shopingcart.svg',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<WishlistCubit, WishlistStates>(
                builder: (context, state) {
                  final wishlistItems = context
                      .watch<WishlistCubit>()
                      .wishlistItems;

                  if (wishlistItems.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            size: 70,
                            color: Color(0xff004182),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Your wishlist is empty',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff004182),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Add items to your wishlist to see them here.',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 24),
                          OutlinedButton.icon(
                            onPressed: () {
                              context.read<LayoutCubit>().changebottomstate(0);
                            },
                            icon: const Icon(Icons.arrow_back, size: 16),
                            label: const Text('Back to Home'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xff004182),
                              side: const BorderSide(color: Color(0xff004182)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: wishlistItems.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      return WishListCard(product: wishlistItems[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
