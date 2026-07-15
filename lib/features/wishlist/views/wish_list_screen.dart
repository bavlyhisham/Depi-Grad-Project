  import 'package:depi/features/home/views/widgets/search_tap.dart';
  import 'package:depi/features/wishlist/controller/wishlist_cubit.dart';
  import 'package:depi/features/wishlist/views/widgets/wishlistcard.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                child: const Searchtap(),
              ),
              const SizedBox(height: 20),
              Expanded(
                  child: BlocBuilder<WishlistCubit, WishlistStates>(
                    builder: (context, state) {
                      final wishlistItems = context.watch<WishlistCubit>().wishlistItems;
                      if (wishlistItems.isEmpty) {
                        return const Center(
                          child: Text(
                            "Your wishlist is empty!",
                            style: TextStyle(
                              color: Color(0xff06004F),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }
                      return ListView.separated(
                        itemCount: wishlistItems.length,
                        physics: const BouncingScrollPhysics(),
                        separatorBuilder: (context, index) => SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          return WishListCard(product: wishlistItems[index]);
                        },
                      );
                    },
                  ),
                ),
            ],
          )
        ),
      );
    }
  }