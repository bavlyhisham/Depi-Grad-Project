import 'package:depi/features/layout/controler/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Custombottomnavbar extends StatelessWidget {
  const Custombottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutCubit.get(context);

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      child: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 26.sp,
          elevation: 6.r,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: const Color.fromRGBO(0, 65, 130, 1),
          currentIndex: cubit.currentindex,
          onTap: (value) {
            if (cubit.currentindex == value) {
              return;
            }
            cubit.changebottomstate(value);
          },
          items: [
            buildItem(Icons.home_outlined, 0, cubit),
            buildItem(Icons.widgets_outlined, 1, cubit),
            buildItem(Icons.favorite_border, 2, cubit),
            buildItem(Icons.settings, 3, cubit),
          ],
        ),
      ),
    );
  }
}

BottomNavigationBarItem buildItem(IconData icon, int index, LayoutCubit cubit) {
  return BottomNavigationBarItem(
    label: '',
    icon: AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: cubit.currentindex == index ? Colors.white : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: cubit.currentindex == index
            ? const Color.fromRGBO(0, 65, 130, 1)
            : Colors.white,
      ),
    ),
  );
}
