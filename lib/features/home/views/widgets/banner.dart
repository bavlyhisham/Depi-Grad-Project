import 'package:carousel_slider/carousel_slider.dart';
import 'package:depi/core/widgets/button.dart';
import 'package:depi/features/home/controler/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ShopBanner extends StatefulWidget {
  ShopBanner({super.key});

  @override
  State<ShopBanner> createState() => _ShopBannerState();
}

class _ShopBannerState extends State<ShopBanner> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // var cubit = CategoryCubit.get(context);
    var homeCubit = HomeCubit.get(context);
    return Stack(
      children: [
        CarouselSlider(
          items: [
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12.r),

                    child: Image(
                      image: const AssetImage('assets/images/bn1.jpg'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20.h,
                  left: 10.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UP TO',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 65, 130, 1),
                          ),
                        ),

                        Text(
                          '25% OFF',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 65, 130, 1),
                          ),
                        ),
                        Text(
                          'For all Headphones\n & AirPods',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 65, 130, 1),
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          height: 40.h,
                          width: 117.w,
                          child: DefaultButton(
                            fontSize: 14.sp,
                            backgroundcolor: Color.fromRGBO(0, 65, 130, 1),
                            foregoundcolor: Colors.white,
                            buttontitle: 'Shop Now',
                            onPressed: () {
                              // // cubit.getProductOfCategory('Electronics',homeCubit.products);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return ProductByCategotyPhoto();
                              //     },
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12.r),

                    child: Image(
                      image: const AssetImage('assets/images/bn2.jpg'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 25.h,
                  left: 30.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UP TO',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 65, 130, 1),
                          ),
                        ),

                        Text(
                          '20% OFF',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 65, 130, 1),
                          ),
                        ),
                        Text(
                          'For Laptops \n& Mobiles',

                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 65, 130, 1),
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          height: 40.h,
                          width: 117.w,
                          child: DefaultButton(
                            fontSize: 14.sp,
                            backgroundcolor: Colors.white,
                            foregoundcolor: Color.fromRGBO(0, 65, 130, 1),
                            buttontitle: 'Shop Now',
                            onPressed: () {
                              // cubit.getProductOfCategory('Electronics',homeCubit.products);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return ProductByCategotyPhoto();
                              //     },
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(12.r),

                    child: Image(
                      image: const AssetImage('assets/images/bn3.jpg'),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20.h,
                  right: 10.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UP TO',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          '30% OFF',
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'For all Makeup \n& Skincare',

                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          height: 40.h,
                          width: 117.w,
                          child: DefaultButton(
                            fontSize: 14.sp,
                            backgroundcolor: Color.fromRGBO(0, 65, 130, 1),
                            foregoundcolor: Colors.white,
                            buttontitle: 'Shop Now',
                            onPressed: () {
                              // cubit.getProductOfCategory('Women\'s Fashion',homeCubit.products);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) {
                              //       return ProductByCategotyPhoto();
                              //     },
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 1,
            reverse: false,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            enableInfiniteScroll: true,
            initialPage: 0,
            scrollDirection: Axis.horizontal,
          ),
        ),

        Positioned(
          bottom: 15,
          left: 175.w,

          child: AnimatedSmoothIndicator(
            effect: WormEffect(
              dotColor: Colors.white,
              activeDotColor: Color(0xff004182),
            ),

            activeIndex: currentIndex,
            count: 3,
          ),
        ),
      ],
    );
  }
}
