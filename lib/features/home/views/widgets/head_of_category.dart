import 'package:depi/features/home/controler/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Headofcategory extends StatelessWidget {
  const Headofcategory({super.key});

  @override
  Widget build(BuildContext context) {
          var cubit = HomeCubit.get(context);

    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Row(
        children: [
          Text(
            'Categories',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(6, 0, 79, 1),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              cubit.seeAllCategories(context);
            },
            style: TextButton.styleFrom(),
            child: Text(
              'view all',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(6, 0, 79, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
