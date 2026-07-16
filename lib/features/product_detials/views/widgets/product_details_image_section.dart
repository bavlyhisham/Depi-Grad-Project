// ignore_for_file: deprecated_member_use

import 'package:depi/core/networks/remote/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsImage extends StatefulWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;
  final VoidCallback onShareTap;

  const ProductDetailsImage({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onShareTap,
  });

  @override
  State<ProductDetailsImage> createState() => _ProductDetailsImageState();
}

class _ProductDetailsImageState extends State<ProductDetailsImage> {
  late final PageController _pageController;
  int currentIndex = 0;

  List<String> get productImages {
    final images = <String>[];

    if (widget.product.imagecover.isNotEmpty) {
      images.add(widget.product.imagecover);
    }

    for (final image in widget.product.images) {
      if (image.isNotEmpty && !images.contains(image)) {
        images.add(image);
      }
    }

    return images;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _topImageButton({
    required IconData icon,
    required VoidCallback onTap,
    Color iconColor = const Color(0xff004182),
    Color backgroundColor = Colors.white,
    Color borderColor = const Color(0x22004182),
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.r),
      onTap: onTap,
      child: Container(
        width: 42.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor, size: 22.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = productImages;

    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.r),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: const Color(0xff004182).withOpacity(0.15),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 280.h,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.network(
                      images[index],
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff004182),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(
                            Icons.broken_image_outlined,
                            size: 60,
                            color: Colors.grey,
                          ),
                        );
                      },
                      frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                            return LayoutBuilder(
                              builder: (context, constraints) {
                                return FittedBox(
                                  fit: BoxFit.contain,
                                  child: SizedBox(
                                    width: constraints.maxWidth,
                                    height: constraints.maxHeight,
                                    child: child,
                                  ),
                                );
                              },
                            );
                          },
                    );
                  },
                ),
              ),

              if (images.length > 1) ...[
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      width: currentIndex == index ? 22.w : 8.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        color: currentIndex == index
                            ? const Color(0xff004182)
                            : const Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        Positioned(
          top: 12.h,
          left: 12.w,
          child: _topImageButton(
            icon: Icons.share_outlined,
            onTap: widget.onShareTap,
          ),
        ),

        Positioned(
          top: 12.h,
          right: 12.w,
          child: _topImageButton(
            icon: widget.isFavorite ? Icons.favorite : Icons.favorite_border,
            iconColor: widget.isFavorite ? Colors.red : const Color(0xff004182),
            backgroundColor: widget.isFavorite
                ? Colors.red.withOpacity(0.08)
                : Colors.white,
            borderColor: widget.isFavorite
                ? Colors.red.withOpacity(0.35)
                : const Color(0xff004182).withOpacity(0.18),
            onTap: widget.onFavoriteTap,
          ),
        ),
      ],
    );
  }
}
