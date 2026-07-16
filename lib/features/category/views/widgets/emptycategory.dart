import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'package:depi/features/layout/views/shop_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Emptycategory extends StatefulWidget {
  const Emptycategory({super.key});

  @override
  State<Emptycategory> createState() => _EmptycategoryState();
}

class _EmptycategoryState extends State<Emptycategory> {
  
  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);
    return Expanded(
                                    child: Container(
                                      color: Colors.white,
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.shopping_cart_outlined,
                                            size: 120.sp,
                                            color: Color(
                                              0xff004182,
                                            ).withOpacity(0.3),
                                          ),
                                          SizedBox(height: 25.h),
                                          Text(
                                            'No products in this category',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Color(
                                                0xff004182,
                                              ).withOpacity(0.5),
                                            ),
                                          ),
                                          SizedBox(height: 15.h),
                                          ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                cubit.currentindex = 0;
                                                Navigator.of(
                                                  context,
                                                ).pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Shoplayout(),
                                                  ),
                                                  (route) => false,
                                                );
                                              });
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                0xff004182,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 25.w,
                                                vertical: 12.h,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                            ),
                                            child: Text(
                                              'Explore Products',
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
  }
}