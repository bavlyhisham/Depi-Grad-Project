import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      body: Center(
        child: Text('Wish List Screen', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
=======
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
>>>>>>> Stashed changes
      ),
    );
  }
}