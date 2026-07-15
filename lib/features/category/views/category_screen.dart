import 'package:depi/core/networks/remote/dio_helper.dart';
import 'package:depi/core/networks/remote/product_model.dart';
import 'package:depi/features/category/views/widgets/categoryitem.dart';
import 'package:depi/features/category/views/widgets/display_item.dart';
import 'package:depi/features/home/views/widgets/search_tap.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;
  bool isLoading = true;
  String? errorMessage;
  List<Product> allProducts = [];

  final List<String> categories = [
    "Men's Fashion",
    "Women's Fashion",
    "Skincare",
    "Beauty",
    "Headphones",
    "Cameras",
    "Laptops & Electronics",
    "Baby & Toys",
  ];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final response = await DioHelper.getData(
        url: '/api/v1/products',
        queryParameters: {'limit': 100},
      );
      final List data = response.data['data'];
      setState(() {
        allProducts = data.map((json) => Product.fromJson(json)).toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Failed to load products';
        isLoading = false;
      });
    }
  }

  List<Product> get filteredProducts {
    final selectedCategory = categories[selectedIndex].toLowerCase();

    return allProducts.where((p) {
      final backendCategory = p.category.name.toLowerCase();

      // Special handling for "Women's Fashion"
      if (selectedCategory.contains("women's")) {
        return backendCategory.contains('women');
      }
      // Special handling for "Men's Fashion" category to avoid matching "
      if (selectedCategory.contains("men's")) {
        return backendCategory.contains('men') &&
            !backendCategory.contains('women');
      }

      // Special handling for "Laptops & Electronics" category
      if (selectedCategory.contains("electronics")) {
        return backendCategory.contains('electronics') ||
            backendCategory.contains('laptops');
      }
      //
      return backendCategory == selectedCategory ||
          backendCategory.contains(selectedCategory) ||
          selectedCategory.contains(backendCategory);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              const Searchtap(),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "products of ${categories[selectedIndex]}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff004182),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.36,
                      decoration: const BoxDecoration(
                        color: Color(0x80DBE4ED),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                        ),
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
                    Expanded(
                      child: isLoading
                          ? const Center(child: CircularProgressIndicator())
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
                                        setState(() {
                                          selectedIndex = 0;
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        size: 16,
                                      ),
                                      label: const Text('Back to Fashion'),
                                      style: OutlinedButton.styleFrom(
                                        foregroundColor: const Color(
                                          0xff004182,
                                        ),
                                        side: const BorderSide(
                                          color: Color(0xff004182),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 10,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.only(left: 8, top: 4),
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
      ),
    );
  }
}
