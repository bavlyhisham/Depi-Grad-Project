import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'package:depi/features/layout/controler/layout_states.dart';
import 'package:depi/features/layout/views/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Shoplayout extends StatelessWidget {
  const Shoplayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return SafeArea(
          bottom: true,
          top: false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Row(
                spacing: 5,
                mainAxisSize:
                    MainAxisSize.min, // علشان الاسم والأيقونة يبقوا مع بعض
                children: [
                  SizedBox(width: 8.w),
                  Text(
                    'Bavly Store',
                    style: TextStyle(
                      color: Color(0xff004182),
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xff004182),
                    size: 28.sp,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Custombottomnavbar(),

            body: cubit.bottomscreens[cubit.currentindex],
          ),
        );
      },
    );
  }
}
