import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< Updated upstream
      body: Center(
        child: Text('Category Screen', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
=======
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: const Searchtap()),
                  const SizedBox(width: 12),
                
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      decoration: BoxDecoration(
                        color: const Color(0x80DBE4ED),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        border: Border(
                          top: BorderSide(
                            color: const Color(0xff004182).withAlpha(45),
                            width: 1.5,
                          ),
                          left: BorderSide(
                            color: const Color(0xff004182).withAlpha(45),
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                        child: ListView.builder(
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryItem(
                              title: categories[index],
                              isSelected: selectedIndex == index,
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 12.0,
                              bottom: 8.0,
                              right: 8.0,
                            ),
                            child: Text(
                              "products of ${categories[selectedIndex]}",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff004182),
                              ),
                            ),
                          ),
                          Expanded(
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : errorMessage != null
                                ? Center(child: Text(errorMessage!))
                                : filteredProducts.isEmpty
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.shopping_bag_outlined,
                                            size: 64,
                                            color: const Color(
                                              0xff004182,
                                            ).withAlpha(100),
                                          ),
                                          const SizedBox(height: 16),
                                          const Text(
                                            'Coming Soon!',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff004182),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Text(
                                            'We are adding new items to this category shortly.',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          OutlinedButton.icon(
                                            onPressed: () {
                                              context
                                                  .read<LayoutCubit>()
                                                  .changebottomstate(0);
                                            },
                                            icon: const Icon(
                                              Icons.arrow_back,
                                              size: 16,
                                            ),
                                            label: const Text('Back to Home'),
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor: const Color(
                                                0xff004182,
                                              ),
                                              side: const BorderSide(
                                                color: Color(0xff004182),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.only(
                                      left: 8,
                                      top: 4,
                                    ),
                                    itemCount: filteredProducts.length,
                                    itemBuilder: (context, index) {
                                      return ProductCard(
                                        product: filteredProducts[index],
                                      );
                                    },
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
>>>>>>> Stashed changes
      ),
    );
  }
}